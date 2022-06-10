import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:sender/data/cubits/route_preferences/route_settings_cubit.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';
import 'package:sender/widgets/common/button_labled_card.dart';
import 'package:sender/widgets/common/labled_card.dart';
import 'package:sender/widgets/common/rating_widget.dart';
import 'package:sender/widgets/common/section_banner.dart';
import 'package:sender/widgets/common/thick_button.dart';

import '../../common/titled_card.dart';

class SettingsPage extends StatefulWidget {
  final RouteSettingsCubit routeSettingsCubit;

  const SettingsPage({
    required this.routeSettingsCubit,
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const double _sidePadding = 12;
  final areaIdController = TextEditingController();
  final minGradeController = TextEditingController();
  final maxGradeController = TextEditingController();
  bool showTopRope = false;
  bool showTrad = false;
  bool showSport = false;
  bool showMultipitch = false;
  // final ratingGroupController = TextEditingController();

  double _$minimumRating = 0.0;
  double get _minimumRating => _$minimumRating;
  set _minimumRating(double rating) {
    double newRating = rating;
    if (newRating <= 0) {
      newRating = 0;
    }
    if (newRating >= 4) {
      newRating = 4;
    }
    _$minimumRating = newRating;
  }

  void setPagePreferences(RoutePreferences prefs) {
    areaIdController.text = prefs.areaId;
    minGradeController.text = prefs.minGrade;
    maxGradeController.text = prefs.maxGrade;
    showTopRope = prefs.showTopRope;
    showMultipitch = prefs.showMultipitch;
    showTrad = prefs.showTrad;
    showSport = prefs.showSport;
    // ratingGroupController.text = prefs.minRating.toString();
    _minimumRating = prefs.minRating;
  }

  @override
  void initState() {
    widget.routeSettingsCubit.loadSavedPreferences();

    super.initState();
  }

  // RoutePreferences get pageRoutePreferences {
  void saveChanges() async {
    var currentSettings = widget.routeSettingsCubit.state.whenOrNull(
      settingsLoaded: (settings) => settings,
    );

    if (currentSettings == null) return;

    widget.routeSettingsCubit.setPreferences(
      currentSettings.copyWith(
        areaId: areaIdController.text.trim(),
        maxGrade: maxGradeController.text.trim(),
        minGrade: minGradeController.text.trim(),
        // minRating: double.parse(ratingGroupController.text.trim()),
        minRating: _minimumRating,
        showMultipitch: showMultipitch,
        showSport: showSport,
        showTopRope: showTopRope,
        showTrad: showTrad,
      ),
    );
    widget.routeSettingsCubit.uploadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseAuthCubit, FirebaseAuthState>(
      builder: (context, authState) {
        return authState.when(
          unauthenticated: () => const Center(
            child: Text('No user loaded'),
          ),
          authenticated: (user) => Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/profile_background.png',
                    ),
                  ),
                ),
                width: double.infinity,
              ),
              // Container(color: Colors.green),
              SingleChildScrollView(
                child: Column(
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     context.read<FirebaseAuthCubit>().signOut();
                    //   },
                    //   child: const Text("Sign out"),
                    // ),
                    const SizedBox(height: 170),
                    Container(
                      decoration: const BoxDecoration(
                        color: col.primary,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(35)),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: _sidePadding),
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
                                  content: Text(
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
                                    return const Center(
                                      child: Text('Loading...'),
                                    );
                                  },
                                  error: (message) => Center(
                                    child: Text('Error: $message'),
                                  ),
                                  settingsLoaded: (settings) {
                                    return Container(
                                      color: col.primary,
                                      child: Column(
                                        children: [
                                          const SectionBanner(text: 'Location'),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: _sidePadding,
                                            ),
                                            child: ButtonLabledCard(
                                              title: settings.areaId,
                                              buttonText: 'set',
                                              onTap: () {
                                                debugPrint('set area pressed');
                                              },
                                            ),
                                          ),
                                          const SectionBanner(
                                              text: 'Route Preferences'),
                                          // const Text('Area Id'),
                                          // TextField(
                                          //     controller: areaIdController),
                                          // const Text('Min Grade'),
                                          // TextField(
                                          //     controller: minGradeController),
                                          // const Text('Max Grade'),
                                          // TextField(
                                          //     controller: maxGradeController),
                                          // const Text('Enable Trad'),
                                          // Switch(
                                          //   value: showTrad,
                                          //   onChanged: (val) {
                                          //     setState(() {
                                          //       showTrad = val;
                                          //     });
                                          //   },
                                          // ),
                                          // const Text('Enable Sport'),
                                          // Switch(
                                          //   value: showSport,
                                          //   onChanged: (val) {
                                          //     setState(() {
                                          //       showSport = val;
                                          //     });
                                          //   },
                                          // ),
                                          // const Text('Enable TopRope'),
                                          // Switch(
                                          //   value: showTopRope,
                                          //   onChanged: (val) {
                                          //     setState(() {
                                          //       showTopRope = val;
                                          //     });
                                          //   },
                                          // ),
                                          // const Text('Min Stars'),
                                          // TextField(
                                          //   controller: ratingGroupController,
                                          // ),
                                          // const Text('Show multipitch'),
                                          // Switch(
                                          //   value: showMultipitch,
                                          //   onChanged: (val) {
                                          //     setState(() {
                                          //       showMultipitch = val;
                                          //     });
                                          //   },
                                          // ),
                                          // ElevatedButton(
                                          //   onPressed: saveChanges,
                                          //   child: const Text('Save'),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: _sidePadding,
                                            ),
                                            child: Column(
                                              children: [
                                                LabledCard(
                                                  title: 'Minimum Rating',
                                                  content: Row(
                                                    children: [
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            _minimumRating -=
                                                                .5;
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color: col.text1,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      RatingWidget(
                                                          rating:
                                                              _minimumRating,
                                                          numStarsShow: 4,
                                                          height: 30),
                                                      const SizedBox(width: 5),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            _minimumRating +=
                                                                .5;
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons.add,
                                                          color: col.text1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                TitledCard(
                                                  title: 'Grade Range',
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20.0,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        const Text(
                                                          '5.0',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Nunito',
                                                            color: col.text2,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: RangeSlider(
                                                            activeColor:
                                                                col.accent,
                                                            onChanged: (vals) {
                                                              debugPrint(
                                                                  'changed: $vals');
                                                            },
                                                            values:
                                                                const RangeValues(
                                                                    .1, .7),
                                                          ),
                                                        ),
                                                        const Text(
                                                          '5.15d',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Nunito',
                                                            color: col.text2,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                              ],
                                            ),
                                          ),
                                          ThickButton(
                                            text: 'Save',
                                            onPressed: () {
                                              debugPrint(
                                                'Save new changes...',
                                              );
                                            },
                                          ),
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
    );
  }
}
