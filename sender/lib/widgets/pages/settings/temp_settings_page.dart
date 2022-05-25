import 'package:flutter/material.dart';
import 'package:sender/data/cubits/cubit/route_settings_cubit.dart';
import '../../../data/models/route_settings.dart' as settings;
import 'package:flutter_bloc/flutter_bloc.dart';

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
  var areaIdController = TextEditingController();
  var minGradeController = TextEditingController();
  var maxGradeController = TextEditingController();
  bool showTradCheck = false;
  bool showSportCheck = true;
  bool showTopRopeCheck = false;
  var ratingGroupController = TextEditingController();
  var pitchesGroupController = TextEditingController();
  var sort1Controller = TextEditingController();
  var sort2Controller = TextEditingController();

  void saveSettings() {
    widget.routeSettingsCubit.saveSettings(pageSettings);
  }

  void loadSettings() {
    RouteSettingsState state = widget.routeSettingsCubit.state;

    state.maybeWhen(
      settingsLoaded: (settings) {
        areaIdController.text = settings.areaId;
        minGradeController.text = settings.minYds;
        maxGradeController.text = settings.maxYds;
        showTradCheck = settings.showTrad;
        showSportCheck = settings.showSport;
        showTopRopeCheck = settings.showTopRope;
        ratingGroupController.text = settings.ratingGroup.toString();
        pitchesGroupController.text = settings.pitchesGroup.toString();
        sort1Controller.text = settings.sort1;
        sort2Controller.text = settings.sort2;
      },
      orElse: () => debugPrint('fail'),
    );
  }

  settings.RouteSettings get pageSettings {
    return settings.RouteSettings(
      areaId: areaIdController.text,
      minYds: minGradeController.text,
      maxYds: maxGradeController.text,
      showTrad: showTradCheck,
      showSport: showSportCheck,
      showTopRope: showTopRopeCheck,
      ratingGroup: double.parse(ratingGroupController.text),
      pitchesGroup: int.parse(pitchesGroupController.text),
      sort1: sort1Controller.text,
      sort2: sort2Controller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteSettingsCubit, RouteSettingsState>(
      bloc: widget.routeSettingsCubit,
      builder: (context, state) {
        loadSettings();
        return Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          padding: const EdgeInsets.all(8),
          color: Colors.green,
          child: ListView(
            children: [
              const Text('Area Id'),
              TextField(
                onChanged: (val) {
                  setState(() {
                    areaIdController.text = val;
                  });
                },
              ),
              const Text('Min Grade'),
              TextField(onChanged: (val) {
                setState(() {
                  minGradeController.text = val;
                });
              }),
              const Text('Max Grade'),
              TextField(onChanged: (val) {
                setState(() {
                  maxGradeController.text = val;
                });
              }),
              const Text('Enable Trad'),
              Switch(
                value: showTradCheck,
                onChanged: (val) {
                  setState(() {
                    showTradCheck = val;
                  });
                },
              ),
              const Text('Enable Sport'),
              Switch(
                value: showSportCheck,
                onChanged: (val) {
                  setState(() {
                    showSportCheck = val;
                  });
                },
              ),
              const Text('Enable TopRope'),
              Switch(
                  value: showTopRopeCheck,
                  onChanged: (val) {
                    setState(() {
                      showTopRopeCheck = val;
                    });
                  }),
              const Text('Rating Group'),
              TextField(
                onChanged: (val) {
                  setState(() {
                    ratingGroupController.text = val;
                  });
                },
              ),
              const Text('Pitches Group'),
              TextField(
                onChanged: (val) {
                  setState(() {
                    pitchesGroupController.text = val;
                  });
                },
              ),
              const Text('Sort 1'),
              TextField(
                onChanged: (val) {
                  setState(() {
                    sort1Controller.text = val;
                  });
                },
              ),
              const Text('Sort 2'),
              TextField(
                onChanged: (val) {
                  setState(() {
                    sort2Controller.text = val;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    saveSettings();
                  });
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }
}
