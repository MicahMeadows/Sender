import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sender/common/constants/colors.dart' as col;
import 'package:sender/data/cubits/route_queue/route_queue_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/models/route_tick/route_tick.dart';
import 'package:sender/widgets/common/rating_widget.dart';
import 'package:sender/widgets/pages/route_detail/route_details_page.dart';

class TickCard extends StatelessWidget {
  final RouteTick tick;
  final void Function() onDismiss;
  const TickCard({
    required this.onDismiss,
    required this.tick,
    Key? key,
  }) : super(key: key);

  static const double _cardHeight = 70;

  @override
  Widget build(BuildContext context) {
    var routeCubit = context.read<RouteQueueCubit>();
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: _cardHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Neumorphic(
              style: NeumorphicStyle(
                color: col.error,
                depth: -5,
                intensity: 5,
                surfaceIntensity: .15,
                shadowDarkColor: Colors.black.withOpacity(.5),
                // shadowLightColor: Colors.transparent,
                lightSource: LightSource.top,
                // shadowLightColorEmboss: Colors.transparent,
              ),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Dismissible(
          key: Key(tick.id),
          direction: DismissDirection.endToStart,
          onDismissed: (dir) => onDismiss(),
          child: InkWell(
            onTap: () async {
              try {
                var routeToOpen = await routeCubit.getRouteDetails(tick.id);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RouteDetailsPage(route: routeToOpen),
                  ),
                );
              } catch (ex) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No route loaded.')),
                );
              }
            },
            child: Container(
              height: _cardHeight,
              decoration: BoxDecoration(
                  color: col.secondary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.25),
                    ),
                  ]),
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        tick.name,
                        style: const TextStyle(
                          color: col.text1,
                          fontSize: 18,
                        ),
                      )),
                      Text(
                        tick.grade,
                        style: const TextStyle(
                          fontSize: 16,
                          color: col.text1,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          tick.area,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Nunito',
                            color: col.text2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      RatingWidget(
                        rating: tick.rating,
                        height: 18,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
