import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/cubits/area_select_cubit/area_select_cubit.dart';

class AreaSelector extends StatefulWidget {
  final AreaSelectCubit areaCubit;
  const AreaSelector({required this.areaCubit, Key? key}) : super(key: key);

  @override
  State<AreaSelector> createState() => _AreaSelectorState();
}

class _AreaSelectorState extends State<AreaSelector> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AreaSelectCubit, AreaSelectState>(
      bloc: widget.areaCubit,
      builder: (context, state) {
        return Container(
          color: Colors.red,
          height: 500,
          child: state.when(
            loading: () => Center(child: Text("Loading")),
            loaded: (selected, subAreas) => Center(child: Text("loaded")),
            error: (message) => Center(child: Text("error: $message")),
          ),
        );
      },
    );
  }
}
