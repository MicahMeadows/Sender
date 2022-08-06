import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/widgets/common/round_button.dart';
import 'package:sender/widgets/common/thick_button.dart';

import '../../../data/cubits/area_select_cubit/area_select_cubit.dart';
import '../../../data/models/area/area.dart';

class AreaSelector extends StatefulWidget {
  final AreaSelectCubit areaCubit;
  const AreaSelector({required this.areaCubit, Key? key}) : super(key: key);

  @override
  State<AreaSelector> createState() => _AreaSelectorState();
}

class _AreaSelectorState extends State<AreaSelector> {
  int? selectedIdx;
  final ScrollController controller = ScrollController();

  Widget _makeLoadedWidget(Area selected, List<Area> subAreas, bool isLeaf) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Text(
          selected.name,
          style: TextStyle(fontSize: 18),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: col.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
            child: CupertinoScrollbar(
              thumbVisibility: true,
              controller: controller,
              thickness: 8,
              radius: const Radius.circular(100),
              child: ListView.builder(
                controller: controller,
                itemCount: subAreas.length,
                itemBuilder: (ctx, idx) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIdx = idx;
                      });
                      widget.areaCubit
                          .setSelectedArea(subAreas[idx], isLeaf: false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 2,
                      ),
                      child: Text(
                        subAreas[idx].name,
                        style: TextStyle(
                          fontWeight: isLeaf && idx == selectedIdx
                              ? FontWeight.bold
                              : FontWeight.w300,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ThickButton(
                  mainColor: col.error,
                  shadowColor: Color(0xFFB05175),
                  text: 'Cancel',
                  onPressed: () => Navigator.of(context).pop()),
              ThickButton(
                  text: 'Save', onPressed: () => Navigator.of(context).pop()),
            ],
          ),
        )
      ],
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
            loading: () => Center(child: Text("Loading")),
            loaded: _makeLoadedWidget,
            error: (message) => Center(child: Text("error: $message")),
          );
        },
      ),
    );
  }
}
