import 'package:bookingapp/core/helpers/app_spacing.dart';
import 'package:bookingapp/core/helpers/app_values.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/feature/events/persentation/controller/events_cubit.dart';
import 'package:bookingapp/feature/events/persentation/widgets/events_listview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsListview extends StatefulWidget {
  const EventsListview({super.key});

  @override
  State<EventsListview> createState() => _EventsListviewState();
}

class _EventsListviewState extends State<EventsListview> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    EventsCubit.of(context).getEvents();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        EventsCubit.of(context).getEvents(isPagination: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = EventsCubit.of(context);
    return BlocBuilder<EventsCubit, EventsState>(
      buildWhen:
          (previous, current) =>
              current is EventsError ||
              current is EventsLoading ||
              current is EventsPagination ||
              current is EventsSuccess ||
              current is NoInternet,
      builder: (context, state) {
        return state is EventsLoading
            ? Center(child: CircularProgressIndicator())
            : state is NoInternet
            ? Center(
              child: Text(
                "Check your Internet Connection Please",
                style: TextStyles.font16Bold,
              ),
            )
            :state is EventsError?Center(child: Text(state.error)): RefreshIndicator(
              onRefresh: () async {
                await cubit.getEvents(isRefresh: true);
              },
              child: ListView.separated(
                shrinkWrap: true,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return EventsListviewCard(
                    eventsEntity: cubit.eventsList[index],
                    onTap: () {
                      AppNavigator.pushNamed(
                        context,
                        AppRoutes.eventsDeatilsScreen,
                        params: {
                          "id": cubit.eventsList[index].eventId.toString(),
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return AppSpace.vertical(AppHight.h10);
                },
                itemCount: cubit.eventsList.length,
              ),
            );
      },
    );
  }
}
