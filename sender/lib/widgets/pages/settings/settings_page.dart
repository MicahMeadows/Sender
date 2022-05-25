import 'package:flutter/material.dart';
import 'package:sender/widgets/common/base_card.dart';
import 'package:sender/widgets/common/section_banner.dart';
import 'package:sender/widgets/common/custom_slider.dart';

class SettingsPageContent extends StatelessWidget {
  late final TextTheme _appTextTheme;
  static const routeName = '/settings';

  // ignore: prefer_const_constructors_in_immutables
  SettingsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _appTextTheme = Theme.of(context).textTheme;

    return Container(
      color: Colors.red,
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
                const SizedBox(width: 5),
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
                const Text(
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                  child: Column(children: const [
                    Text('Minimum Rating'),
                    SizedBox(height: 18),
                    CustomSlider(
                      numHandles: 3,
                      handleRadius: 10,
                      colors: [
                        Colors.green,
                        Colors.red,
                        Colors.blue,
                      ],
                      values: [.1, .5, .7],
                    ),
                    SizedBox(height: 18),
                  ]),
                ),
                BaseCard(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                  child: Column(
                    children: const [
                      Text('Sort By'),
                      SizedBox(height: 18),
                      Placeholder(fallbackHeight: 25),
                      SizedBox(height: 18),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SectionBanner(
                  text: 'Grade Settings',
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {
                        debugPrint('press add route pref');
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ),
                _buildGradeSettingCard(
                  icon: const Icon(Icons.rocket_launch_sharp),
                  title: 'Sport',
                  onDelete: () {
                    debugPrint('delete sport');
                  },
                ),
                _buildGradeSettingCard(
                  icon: const Icon(Icons.umbrella_outlined),
                  title: 'Boulder',
                  onDelete: () {
                    debugPrint('delete sport');
                  },
                ),
                _buildGradeSettingCard(
                  icon: const Icon(Icons.umbrella_outlined),
                  title: 'Boulder',
                  onDelete: () {
                    debugPrint('delete sport');
                  },
                ),
                _buildGradeSettingCard(
                  icon: const Icon(Icons.umbrella_outlined),
                  title: 'Boulder',
                  onDelete: () {
                    debugPrint('delete sport');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

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
}
