import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sender/data/models/route_settings/route_settings.dart'
    as settings;

class TempSettingsPage extends StatefulWidget {
  const TempSettingsPage({
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
  bool showSport = true;
  final ratingGroupController = TextEditingController();
  final pitchesGroupController = TextEditingController();
  final sort1Controller = TextEditingController();
  final sort2Controller = TextEditingController();

  settings.RouteSettings get pageSettings {
    return settings.RouteSettings(
      areaId: areaIdController.text,
      minYds: minGradeController.text,
      maxYds: maxGradeController.text,
      showTrad: showTrad,
      showSport: showSport,
      showTopRope: showTopRope,
      ratingGroup: double.parse(ratingGroupController.text),
      pitchesGroup: int.parse(pitchesGroupController.text),
      sort1: sort1Controller.text,
      sort2: sort2Controller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
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
              debugPrint(jsonEncode(pageSettings.toJson()));
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
