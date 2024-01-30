import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/dimens.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

import '../models/search_result.dart';
import 'search_destination_delegate.dart';

class SearchBarIcon extends StatelessWidget {
  const SearchBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return (!state.showManualMarker)
          ? const _SearchBarIconView()
          : const SizedBox();
    });
  }
}

class _SearchBarIconView extends StatelessWidget {
  const _SearchBarIconView({super.key});

  @override
  Widget build(BuildContext context) {
    void onSearchResult(BuildContext context, SearchResult result) {
      final searchBloc = context.read<SearchBloc>();

      if (result.manual) {
        searchBloc.add(const ShowManualMarkerEvent(true));
      }
    }

    return Align(
      alignment: Alignment.topRight,
      child: SafeArea(
        child: InkWell(
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
            margin: const EdgeInsets.all(TrackingDimens.dimen_12),
            padding: const EdgeInsets.all(TrackingDimens.dimen_8),
            child: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
