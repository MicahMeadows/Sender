import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/data/cubits/tick_filter/tick_filter_cubit.dart';
import 'package:sender/data/models/tick_filters/tick_filters.dart';

import '../../common/rating_widget.dart';
import '../../common/thick_button.dart';

class TodoFilterDialog extends StatefulWidget {
  const TodoFilterDialog({Key? key}) : super(key: key);

  @override
  State<TodoFilterDialog> createState() => _TodoFilterDialogState();
}

class _TodoFilterDialogState extends State<TodoFilterDialog> {
  late TickFilters pageFilters;
  late final _filterCubit = context.read<TickFilterCubit>();

  @override
  void initState() {
    _filterCubit.state.whenOrNull(
      set: (filters) {
        setState(() {
          pageFilters = filters;
        });
      },
      none: () {
        pageFilters = TickFilters(
          enableSport: true,
          enableTopRope: true,
          enableTrad: true,
          maxGrade: '5.15d',
          minGrade: '5.0',
          minRating: 0,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: col.background,
        ),
        child: Column(
          children: [
            const Text('Set Filters'),
            Text('Minimum Rating'),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      final newRating = pageFilters.minRating - .5;
                      pageFilters = pageFilters.copyWith(minRating: newRating);
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                    color: col.accent,
                  ),
                ),
                const SizedBox(width: 5),
                RatingWidget(
                    color: col.accent,
                    rating: pageFilters.minRating,
                    numStarsShow: 3,
                    height: 30),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      final newRating = pageFilters.minRating + .5;
                      pageFilters = pageFilters.copyWith(minRating: newRating);
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: col.accent,
                  ),
                ),
              ],
            ),
            Text('Climb Types'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                ThickButton(
                  mainColor: col.error,
                  shadowColor: const Color(0xFFB05175),
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.of(context).pop(this);
                  },
                ),
                const SizedBox(width: 20),
                ThickButton(
                  text: 'Save',
                  onPressed: () {
                    _filterCubit.setFilters(pageFilters);
                    Navigator.of(context).pop(this);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
