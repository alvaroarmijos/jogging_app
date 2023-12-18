import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/models/search_result.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';
import 'package:tracking_app/src/packages/features/tracking/widgets/widgets.dart';

class SearchBarInfo extends StatelessWidget {
  const SearchBarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return (state.showManulMarker)
            ? const SizedBox()
            : const _SearchBarInfoView();
      },
    );
  }
}

class _SearchBarInfoView extends StatelessWidget {
  const _SearchBarInfoView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Align(
      alignment: Alignment.topCenter,
      child: FadeInDown(
        duration: const Duration(milliseconds: 300),
        child: const SizedBox(
          height: TrackingDimens.dimen_60,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: TrackingDimens.dimen_8),
            child: Card(
              child: Row(
                children: [
                  RunningInfo(),
                  SearchIcon(),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        onPressed: () {
          showSearch(context: context, delegate: SerchDestinationDelegate())
              .then((result) {
            if (result == null) return;
            onSearchResult(context, result);
          });
        },
        icon: Icon(
          Icons.search,
          color: TrackingColors.primary,
        ),
      ),
    );
  }

  void onSearchResult(BuildContext context, SearchResult result) {
    final searchBloc = context.read<SearchBloc>();

    if (result.manual) {
      searchBloc.add(const ShowManualMarkerEvent(true));
      return;
    }

    if (result.position != null) {
      final locationBloc = context.read<LocationBloc>();
      final start = locationBloc.state.lastKownLocation;
      if (start == null) return;

      searchBloc.add(GetRouteEvent(start, result.position!));
    }
  }
}
