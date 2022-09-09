import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/widgets/common/knot_progress_indicator.dart';
import 'package:sender/widgets/common/round_button.dart';
import 'package:sender/widgets/common/thick_button.dart';

import '../../../data/cubits/area_select_cubit/area_select_cubit.dart';
import '../../../data/models/area/area.dart';
import '../../../data/models/climbing_route/climbing_route.dart';

class AreaSelector extends StatefulWidget {
  final AreaSelectCubit areaCubit;
  final void Function(Area newArea) onSave;
  const AreaSelector({
    required this.onSave,
    required this.areaCubit,
    Key? key,
  }) : super(key: key);

  @override
  State<AreaSelector> createState() => _AreaSelectorState();
}

class _AreaSelectorState extends State<AreaSelector> {
  @override
  void dispose() {
    // widget.areaCubit.close();
    super.dispose();
  }

  int? selectedIdx;
  final ScrollController controller = ScrollController();

  Widget _buildAreaList(List<Area> areas, Area selected) {
    final selIdx = areas.indexOf(selected);
    return ListView.builder(
      controller: controller,
      itemCount: areas.length,
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemBuilder: (ctx, idx) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedIdx = idx;
            });
            widget.areaCubit.setSelectedArea(areas[idx]);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 5,
            ),
            child: Text(
              '${idx > selIdx ? '- ' : ''}${areas[idx].name}',
              style: TextStyle(
                color: idx > selIdx ? col.accent : Colors.white,
                fontWeight:
                    selected == areas[idx] ? FontWeight.bold : FontWeight.w300,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _makeLoadedWidget(Area selected, List<Area> subAreas) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Select Area',
            // selected.name,
            maxLines: 3,
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: col.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CupertinoScrollbar(
                thumbVisibility: true,
                controller: controller,
                thickness: 8,
                radius: const Radius.circular(100),
                child: _buildAreaList(subAreas, selected),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ThickButton(
                  mainColor: col.error,
                  shadowColor: Color(0xFFB05175),
                  text: 'Cancel',
                  onPressed: () => Navigator.of(context).pop()),
              ThickButton(
                text: 'Save',
                onPressed: () {
                  widget.onSave(selected);
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: col.primary,
      ),
      height: MediaQuery.of(context).size.height * .7,
      width: MediaQuery.of(context).size.width * .8,
      child: BlocBuilder<AreaSelectCubit, AreaSelectState>(
        bloc: widget.areaCubit,
        builder: (context, state) {
          return state.when(
            loading: () => const Center(
              child: KnotProgressIndicator(
                color: Colors.white,
              ),
            ),
            loaded: (selected, subAreas) {
              // final areas = subAreas.where((area) {
              //   if (selected.level == null) return false;
              //   if (area.level == null) return false;
              //   return area.level! > selected.level!;
              // }).toList();
              selectedIdx = subAreas.indexOf(
                  subAreas.firstWhere((element) => element.id == selected.id));

              return _makeLoadedWidget(selected, subAreas);
            },
            error: (message) => Center(child: Text("error: $message")),
          );
        },
      ),
    );
  }
}
