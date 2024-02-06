import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/dimens.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';
import 'package:tracking_app/src/packages/features/tracking/widgets/widgets.dart';

import '../models/search_result.dart';

class SearchBarInfomation extends StatelessWidget {
  const SearchBarInfomation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return (!state.showManualMarker)
          ? const _SearchBarInfomationView()
          : const SizedBox();
    });
  }
}

class _SearchBarInfomationView extends StatelessWidget {
  const _SearchBarInfomationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: SafeArea(
        child: SizedBox(
          height: 70,
          child: Card(
            margin: EdgeInsets.all(TrackingDimens.dimen_12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RunningInfo(),
                _SearchIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchIcon extends StatelessWidget {
  const _SearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void onSearchResult(BuildContext context, SearchResult result) {
      final searchBloc = context.read<SearchBloc>();

      if (result.manual) {
        searchBloc.add(const ShowManualMarkerEvent(true));
      }

      if (result.position != null) {
        final start = context.read<LocationBloc>().state.lastKnownLocation;

        if (start == null) return;

        searchBloc.add(GetRouteEvent(start, result.position!));
      }
    }

    return InkWell(
      onTap: () async {
        final result = await showSearch(
          context: context,
          delegate: SearchDestinationDelegate(),
        );
        if (result == null) return;
        onSearchResult(context, result);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(TrackingDimens.dimen_8),
        child: const Center(
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
