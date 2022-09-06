import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:sender/data/cubits/route_preferences/route_settings_cubit.dart';
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/main.dart';
import 'package:sender/widgets/common/button_labled_card.dart';
import 'package:sender/widgets/common/knot_progress_indicator.dart';
import 'package:sender/widgets/common/labled_card.dart';
import 'package:sender/widgets/common/labled_toggle_card.dart';
import 'package:sender/widgets/common/rating_widget.dart';
import 'package:sender/widgets/common/section_banner.dart';
import 'package:sender/widgets/common/thick_button.dart';
import 'package:sender/widgets/pages/settings/area_selector.dart';
import '../../../data/models/area/area.dart';
import 'settings_helper.dart';
import 'package:sender/common/helpers/climbing_route_helpers.dart';

class SettingsPage extends StatefulWidget {
  final RouteSettingsCubit routeSettingsCubit;
  final RouteQueueCubit queueCubit;

  const SettingsPage({
    required this.routeSettingsCubit,
    required this.queueCubit,
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const double _sidePadding = 12;
  final areaIdController = TextEditingController();
  Area setArea = const Area(id: "0", level: 0, name: "All Locations");
  bool showTopRope = false;
  bool showTrad = false;
  bool showSport = false;
  bool showMultipitch = false;
  String minGrade = '';
  String maxGrade = '';

  double _$minimumRating = 0.0;
  double get _minimumRating => _$minimumRating;
  set _minimumRating(double rating) {
    double newRating = rating;
    if (newRating <= 0) {
      newRating = 0;
    }
    if (newRating >= 3) {
      newRating = 3;
    }
    _$minimumRating = newRating;
  }

  void setPagePreferences(RoutePreferences prefs) {
    areaIdController.text = prefs.area.name;
    showTopRope = prefs.showTopRope;
    showMultipitch = prefs.showMultipitch;
    showTrad = prefs.showTrad;
    showSport = prefs.showSport;
    _minimumRating = prefs.minRating;
    minGrade = prefs.minGrade;
    maxGrade = prefs.maxGrade;
  }

  RoutePreferences get getPagePreferences {
    return RoutePreferences(
      // areaId: areaIdController.text,
      area: setArea,
      minGrade: minGrade,
      maxGrade: maxGrade,
      showTrad: showTrad,
      showSport: showSport,
      showTopRope: showTopRope,
      minRating: _minimumRating,
      showMultipitch: showMultipitch,
    );
  }

  @override
  void initState() {
    widget.routeSettingsCubit.loadSavedPreferences();

    super.initState();
  }

  void saveChanges() async {
    // var currentSettings = widget.routeSettingsCubit.state.whenOrNull(
    //   settingsLoaded: (settings) => settings.copyWith(),
    // );

    // if (currentSettings == null) return;

    String lowerGrade = minClimbingGrade(
      getPagePreferences.minGrade,
      getPagePreferences.maxGrade,
    );

    debugPrint('min ${getPagePreferences.minGrade}');
    debugPrint('max ${getPagePreferences.maxGrade}');
    debugPrint('lower ${lowerGrade}');

    if (lowerGrade != getPagePreferences.minGrade) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Minimum grade must be below or equal to maximum grade.',
          ),
        ),
      );
      return;
    }

    widget.routeSettingsCubit.setPreferences(getPagePreferences);
    widget.routeSettingsCubit.uploadPreferences();
    navigationCubit.showHome();
    widget.queueCubit.reloadRoutes();
  }

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Material(
              color: Colors.transparent,
              child: AreaSelector(
                areaCubit: routeSettingsCubit.createAreaSelectCubit(),
                onSave: (newArea) {
                  print('test');
                  setState(() {
                    setArea = newArea;
                  });
                },
              ),
            ),
          ],
        );
      },
      // transitionBuilder: (_, anim, __, child) {
      //   Tween<Offset> tween;
      //   if (anim.status == AnimationStatus.reverse) {
      //     tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      //   } else {
      //     tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      //   }

      //   return BackdropFilter(
      //     filter: ImageFilter.blur(
      //       sigmaX: 4 * anim.value,
      //       sigmaY: 4 * anim.value,
      //     ),
      //     child: SlideTransition(
      //       position: tween.animate(anim),
      //       child: FadeTransition(
      //         opacity: anim,
      //         child: child,
      //       ),
      //     ),
      //   );
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FirebaseAuthCubit, FirebaseAuthState>(
        builder: (context, authState) {
          return authState.when(
            unauthenticated: () => const Center(
              child: Text('No user loaded'),
            ),
            authenticated: (user) => Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: col.primary,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(35)),
                        ),
                        child: const Center(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: _sidePadding),
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: col.primary,
                        child: Column(
                          children: [
                            SectionBanner(
                              text: 'Account Settings',
                              trailing: InkWell(
                                  onTap: () {
                                    context.read<FirebaseAuthCubit>().signOut();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      'Sign out',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: col.text2,
                                      ),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: _sidePadding),
                              child: Column(
                                children: [
                                  LabledCard(
                                    title: 'Email:',
                                    child: Text(
                                      user.email ?? 'N/A',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Nunito',
                                        color: col.text2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  ButtonLabledCard(
                                    title: 'Password',
                                    buttonText: 'change',
                                    onTap: () {
                                      debugPrint('tap pass change');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: col.primary,
                              child: BlocConsumer<RouteSettingsCubit,
                                  RouteSettingsState>(
                                buildWhen: (previous, current) =>
                                    previous != current,
                                listener: (context, state) {
                                  state.whenOrNull(
                                    settingsLoaded: (settings) {
                                      setPagePreferences(settings);
                                    },
                                  );
                                },
                                builder: (context, state) {
                                  return state.when(
                                    settingsLoading: () {
                                      return Container(
                                        margin: const EdgeInsets.only(top: 30),
                                        child: const Center(
                                          child: KnotProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    },
                                    error: (message) => Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 30),
                                            const Icon(
                                              Icons.error_outline_rounded,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            Text(
                                                'Failed to load route preferences: $message'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // error: (message) => Center(
                                    //   child: Text('Error: $message'),
                                    // ),
                                    settingsLoaded: (settings) {
                                      return Container(
                                        color: col.primary,
                                        child: Column(
                                          children: [
                                            SectionBanner(text: 'Location'),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: _sidePadding,
                                              ),
                                              child: ButtonLabledCard(
                                                title: setArea.name,
                                                buttonText: 'set',
                                                onTap: () {
                                                  debugPrint(
                                                      'set area pressed');
                                                  showCustomDialog(
                                                    context,
                                                  );
                                                },
                                              ),
                                            ),
                                            const SectionBanner(
                                                text: 'Route Preferences'),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: _sidePadding,
                                              ),
                                              child: Column(
                                                children: [
                                                  LabledCard(
                                                    sidePriority:
                                                        LabledCardSidePriority
                                                            .left,
                                                    title: 'Minimum Rating',
                                                    child: Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              _minimumRating -=
                                                                  .5;
                                                            });
                                                          },
                                                          child: const Icon(
                                                            Icons.remove,
                                                            color: col.accent,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 5),
                                                        RatingWidget(
                                                            color: col.accent,
                                                            rating:
                                                                _minimumRating,
                                                            numStarsShow: 3,
                                                            height: 30),
                                                        const SizedBox(
                                                            width: 5),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              _minimumRating +=
                                                                  .5;
                                                            });
                                                          },
                                                          child: const Icon(
                                                            Icons.add,
                                                            color: col.accent,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  LabledCard(
                                                    sidePriority:
                                                        LabledCardSidePriority
                                                            .left,
                                                    title: 'Grade Range',
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        DropdownButton<String>(
                                                            value: minGrade,
                                                            focusColor:
                                                                col.text1,
                                                            dropdownColor:
                                                                col.primary,
                                                            items: gradeOptions
                                                                .map((e) => DropdownMenuItem<
                                                                        String>(
                                                                    value: e,
                                                                    child: Text(
                                                                        e)))
                                                                .toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                minGrade =
                                                                    val ?? '';
                                                              });
                                                            }),
                                                        const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      15),
                                                          child: Text('to'),
                                                        ),
                                                        DropdownButton<String>(
                                                            value: maxGrade,
                                                            focusColor:
                                                                col.text1,
                                                            dropdownColor:
                                                                col.primary,
                                                            items: gradeOptions
                                                                .map((e) => DropdownMenuItem<
                                                                        String>(
                                                                    value: e,
                                                                    child: Text(
                                                                        e)))
                                                                .toList(),
                                                            onChanged: (val) {
                                                              setState(() {
                                                                maxGrade =
                                                                    val ?? '';
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                  LabledToggleCard(
                                                    title: 'Sport',
                                                    value: showSport,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        showSport = value;
                                                      });
                                                    },
                                                  ),
                                                  LabledToggleCard(
                                                    title: 'Top Rope',
                                                    value: showTopRope,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        showTopRope = value;
                                                      });
                                                    },
                                                  ),
                                                  LabledToggleCard(
                                                    title: 'Trad',
                                                    value: showTrad,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        showTrad = value;
                                                      });
                                                    },
                                                  ),
                                                  LabledToggleCard(
                                                    title: 'Multi-pitch',
                                                    value: showMultipitch,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        showMultipitch = value;
                                                      });
                                                    },
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              ),
                                            ),
                                            ThickButton(
                                              text: 'Save',
                                              onPressed: saveChanges,
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
