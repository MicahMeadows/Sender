import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/data/cubits/tick_filter/tick_filter_cubit.dart';
import 'package:sender/data/models/tick_filters/tick_filters.dart';

import '../../common/rating_widget.dart';
import '../../common/thick_button.dart';
import '../settings/settings_helper.dart';

class TodoFilterDialog extends StatefulWidget {
  const TodoFilterDialog({Key? key}) : super(key: key);

  @override
  State<TodoFilterDialog> createState() => _TodoFilterDialogState();
}

class _TodoFilterDialogState extends State<TodoFilterDialog> {
  late TickFilters pageFilters;
  late final _filterCubit = context.read<TickFilterCubit>();

  void initPageFilters() {
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
  }

  @override
  void initState() {
    initPageFilters();

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
            Row(
              children: [
                const Spacer(flex: 1),
                const Text(
                  'Set Filters',
                  style: TextStyle(fontSize: 28),
                ),
                if (pageFilters.numFilters > 0)
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _filterCubit.clearFilters();
                          initPageFilters();
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'clear',
                          style: TextStyle(
                            fontSize: 18,
                            color: col.error,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (pageFilters.numFilters == 0)
                  const Spacer(
                    flex: 1,
                  ),
              ],
            ),
            const SizedBox(height: 15),
            const Text('Grade Range'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                    value: pageFilters.minGrade,
                    focusColor: col.text1,
                    dropdownColor: col.primary,
                    items: gradeOptions
                        .map((e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        final newMinGrade = val ?? '';
                        pageFilters =
                            pageFilters.copyWith(minGrade: newMinGrade);
                      });
                    }),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('to'),
                ),
                DropdownButton<String>(
                    value: pageFilters.maxGrade,
                    focusColor: col.text1,
                    dropdownColor: col.primary,
                    items: gradeOptions
                        .map((e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        final newMaxGrade = val ?? '';
                        pageFilters =
                            pageFilters.copyWith(maxGrade: newMaxGrade);
                      });
                    }),
              ],
            ),
            const SizedBox(height: 15),
            const Text('Minimum Rating'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  height: 35,
                ),
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
            const SizedBox(height: 15),
            Text('Climb Types'),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Trad'),
                  Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: pageFilters.enableTrad,
                      onChanged: (newVal) {
                        setState(() {
                          pageFilters =
                              pageFilters.copyWith(enableTrad: newVal);
                        });
                      }),
                  Text('Sport'),
                  Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: pageFilters.enableSport,
                      onChanged: (newVal) {
                        setState(() {
                          pageFilters =
                              pageFilters.copyWith(enableSport: newVal);
                        });
                      }),
                ],
              ),
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Top Rope'),
                  Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: pageFilters.enableTopRope,
                      onChanged: (newVal) {
                        setState(() {
                          pageFilters =
                              pageFilters.copyWith(enableTopRope: newVal);
                        });
                      }),
                ],
              ),
            ),
            const SizedBox(height: 15),
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
                    if (pageFilters.numFilters == 0) {
                      _filterCubit.clearFilters();
                    } else {
                      _filterCubit.setFilters(pageFilters);
                    }
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
