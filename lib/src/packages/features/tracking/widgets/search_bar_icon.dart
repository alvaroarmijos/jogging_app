import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/models/search_result.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';
import 'package:tracking_app/src/packages/features/tracking/widgets/widgets.dart';

class SearchBarIcon extends StatelessWidget {
  const SearchBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return (state.showManulMarker)
            ? const SizedBox()
            : const _SearchBarIconView();
      },
    );
  }
}

class _SearchBarIconView extends StatelessWidget {
  const _SearchBarIconView();

  void onSearchResult(BuildContext context, SearchResult result) {
    final searchBloc = context.read<SearchBloc>();

    if (result.manual) {
      searchBloc.add(const ShowManualMarkerEvent());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Align(
      alignment: Alignment.topRight,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () async {
            final result = await showSearch(
                context: context, delegate: SerchDestinationDelegate());
            if (result == null) return;
            onSearchResult(context, result);
          },
          icon: Icon(
            Icons.search,
            color: TrackingColors.primary,
          ),
        ),
      ),
    ));
  }
}
