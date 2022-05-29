import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:sender/data/cubits/route_preferences/route_settings_cubit.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';

class TempSettingsPage extends StatefulWidget {
  final RouteSettingsCubit routeSettingsCubit;

  const TempSettingsPage({
    required this.routeSettingsCubit,
    Key? key,
  }) : super(key: key);

  @override
  State<TempSettingsPage> createState() => _TempSettingsPageState();
}

class _TempSettingsPageState extends State<TempSettingsPage> {
  final areaIdController = TextEditingController();
  final minGradeController = TextEditingController();
  final maxGradeController = TextEditingController();
  bool showTopRope = false;
  bool showTrad = false;
  bool showSport = false;
  bool showMultipitch = false;
  final ratingGroupController = TextEditingController();

  RoutePreferences get pageRoutePreferences {
    return RoutePreferences(
      areaId: areaIdController.text,
      minGrade: minGradeController.text,
      maxGrade: maxGradeController.text,
      showTrad: showTrad,
      showSport: showSport,
      showTopRope: showTopRope,
      minRating: double.parse(ratingGroupController.text),
      showMultipitch: showMultipitch,
    );
  }

  void setPageRoutePreferences(RoutePreferences preferences) {
    areaIdController.text = preferences.areaId;
    minGradeController.text = preferences.minGrade;
    maxGradeController.text = preferences.maxGrade;
    showTrad = preferences.showTrad;
    showSport = preferences.showSport;
    showTopRope = preferences.showTopRope;
    ratingGroupController.text = preferences.minRating.toString();
    showMultipitch = preferences.showMultipitch;
  }

  void loadPagePreferences() {
    var preferenceCubitState = widget.routeSettingsCubit.state;
    preferenceCubitState.whenOrNull(
      settingsLoaded: (settings) {
        setState(() {
          setPageRoutePreferences(settings);
        });
      },
    );
  }

  void saveChanges() async {
    widget.routeSettingsCubit.saveNewPreferences(pageRoutePreferences);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteSettingsCubit, RouteSettingsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        debugPrint('Rebuild');
        state.whenOrNull(
          settingsLoaded: ((settings) => setPageRoutePreferences(settings)),
        );

        return state.maybeWhen(
          settingsLoading: () {
            return const Center(
              child: Text('Loading...'),
            );
          },
          orElse: () {
            return Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              child: ListView(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<FirebaseAuthCubit>().signOut();
                    },
                    child: const Text("Sign out"),
                  ),
                  const Text('Area Id'),
                  TextField(controller: areaIdController),
                  const Text('Min Grade'),
                  TextField(controller: minGradeController),
                  const Text('Max Grade'),
                  TextField(controller: maxGradeController),
                  const Text('Enable Trad'),
                  Switch(
                    value: showTrad,
                    onChanged: (val) {
                      setState(() {
                        showTrad = val;
                      });
                    },
                  ),
                  const Text('Enable Sport'),
                  Switch(
                    value: showSport,
                    onChanged: (val) {
                      setState(() {
                        showSport = val;
                      });
                    },
                  ),
                  const Text('Enable TopRope'),
                  Switch(
                      value: showTopRope,
                      onChanged: (val) {
                        setState(() {
                          showTopRope = val;
                        });
                      }),
                  const Text('Min Stars'),
                  TextField(
                    controller: ratingGroupController,
                  ),
                  const Text('Show multipitch'),
                  Switch(
                    value: showMultipitch,
                    onChanged: (val) {
                      setState(() {
                        showMultipitch = val;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: saveChanges,
                    // onPressed: () async {
                    // debugPrint(jsonEncode(pageRoutePreferences.toJson()));
                    // var userRepo = context.read<IUserRepository>();
                    // var firebaseAuth = context.read<FirebaseAuthCubit>();
                    // firebaseAuth.state.when(
                    //   authenticated: (user) async {
                    //     try {
                    //       await userRepo
                    //           .updateRoutePreferences(pageRoutePreferences);
                    //     } catch (ex) {
                    //       debugPrint(
                    //         'Failed to update preferences: ${ex.toString()}',
                    //       );
                    //     }
                    //   },
                    //   unauthenticated: () => 'No Auth',
                    // );
                    // },
                    child: const Text('Save'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
