import 'package:flutter/material.dart';
import 'package:sender/widgets/common/base_card.dart';
import 'package:sender/widgets/common/section_banner.dart';

class SettingsPage extends StatelessWidget {
  late final TextTheme _appTextTheme;
  static const routeName = '/settings';
  SettingsPage({Key? key}) : super(key: key);

  Widget _buildGradeSettingCard({
    required Widget icon,
    required String title,
    required void Function() onDelete,
  }) {
    return BaseCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              const SizedBox(width: 10),
              Text(
                title,
                style: _appTextTheme.bodySmall,
              ),
              const Spacer(),
              InkWell(
                onTap: onDelete,
                child: const Text(
                  'delete',
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
            indent: 25,
            endIndent: 25,
          ),
          const Placeholder(fallbackHeight: 95),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _appTextTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                    Text(
                      'Adam Ondra',
                      style: _appTextTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Settings',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SectionBanner(text: 'Route Preferences'),
                    BaseCard(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                      child: Column(children: [
                        Text('Minimum Rating'),
                        const SizedBox(height: 18),
                        Placeholder(fallbackHeight: 25),
                        const SizedBox(height: 18),
                      ]),
                    ),
                    BaseCard(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                      child: Column(children: [
                        Text('Sort By'),
                        const SizedBox(height: 18),
                        Placeholder(fallbackHeight: 25),
                        const SizedBox(height: 18),
                      ]),
                    ),
                    const SizedBox(height: 10),
                    SectionBanner(
                      text: 'Grade Settings',
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          onPressed: () {
                            print('press add route pref');
                          },
                          icon: Icon(Icons.add),
                        ),
                      ),
                    ),
                    _buildGradeSettingCard(
                      icon: Icon(Icons.rocket_launch_sharp),
                      title: 'Sport',
                      onDelete: () {
                        print('delete sport');
                      },
                    ),
                    _buildGradeSettingCard(
                      icon: Icon(Icons.umbrella_outlined),
                      title: 'Boulder',
                      onDelete: () {
                        print('delete sport');
                      },
                    ),
                    _buildGradeSettingCard(
                      icon: Icon(Icons.umbrella_outlined),
                      title: 'Boulder',
                      onDelete: () {
                        print('delete sport');
                      },
                    ),
                    _buildGradeSettingCard(
                      icon: Icon(Icons.umbrella_outlined),
                      title: 'Boulder',
                      onDelete: () {
                        print('delete sport');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
