import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
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
  bool showMultipitch = false;
  final ratingGroupController = TextEditingController();
  final pitchesGroupController = TextEditingController();

  settings.RouteSettings get pageSettings {
    return settings.RouteSettings(
      areaId: areaIdController.text,
      minYds: minGradeController.text,
      maxYds: maxGradeController.text,
      showTrad: showTrad,
      showSport: showSport,
      showTopRope: showTopRope,
      minRating: int.parse(ratingGroupController.text),
      showMultipitch: showMultipitch,
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
