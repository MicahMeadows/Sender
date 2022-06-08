import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:sender/data/cubits/route_preferences/route_settings_cubit.dart';
import 'package:sender/data/models/route_preferences/route_preferences.dart';

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
  final areaIdController = TextEditingController();
  final minGradeController = TextEditingController();
  final maxGradeController = TextEditingController();
  bool showTopRope = false;
  bool showTrad = false;
  bool showSport = false;
  bool showMultipitch = false;
  final ratingGroupController = TextEditingController();

  void setPagePreferences(RoutePreferences prefs) {
    areaIdController.text = prefs.areaId;
    minGradeController.text = prefs.minGrade;
    maxGradeController.text = prefs.maxGrade;
    showTopRope = prefs.showTopRope;
    showMultipitch = prefs.showMultipitch;
    showTrad = prefs.showTrad;
    showSport = prefs.showSport;
    ratingGroupController.text = prefs.minRating.toString();
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
        minRating: double.parse(ratingGroupController.text.trim()),
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
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<FirebaseAuthCubit>().signOut();
            },
            child: const Text("Sign out"),
          ),
          Expanded(
            child: BlocConsumer<RouteSettingsCubit, RouteSettingsState>(
              buildWhen: (previous, current) => previous != current,
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
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                      ),
                      padding: const EdgeInsets.all(8),
                      color: Colors.green,
                      child: ListView(
                        children: [
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
                            },
                          ),
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
                            child: const Text('Save'),
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
    );
  }
}
