import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/models/search_result.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

class SerchDestinationDelegate extends SearchDelegate<SearchResult> {
  SerchDestinationDelegate()
      : super(
          searchFieldLabel: "Buscar...",
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          final searchResult = SearchResult(cancel: true);
          close(context, searchResult);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    final lastKnownLocation =
        context.read<LocationBloc>().state.lastKownLocation!;
    final searchBloc = context.read<SearchBloc>()
      ..add(GetPlacesEvent(lastKnownLocation, query));

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final places = state.places;

        return ListView.separated(
          itemBuilder: (context, index) {
            final place = places[index];
            return ListTile(
              title: Text(place.text),
              subtitle: Text(place.placeName),
              leading: Icon(
                Icons.place_outlined,
                color: TrackingColors.primary,
              ),
              onTap: () {
                final result = SearchResult(
                  cancel: false,
                  manual: false,
                  position: LatLng(place.center[1], place.center[0]),
                  name: place.text,
                  description: place.placeName,
                );

                searchBloc.add(AddToHistoryEvent(place));

                close(context, result);
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: places.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final history = context.read<SearchBloc>().state.history;

    return ListView(
      children: [
        ListTile(
          leading: Icon(
            Icons.location_on_outlined,
            color: TrackingColors.primary,
          ),
          title: const Text("Colocar la ubicación en el mapa"),
          onTap: () {
            final searchResult = SearchResult(cancel: false, manual: true);
            close(context, searchResult);
          },
        ),
        ...history.map((place) => ListTile(
              leading: Icon(
                Icons.history_outlined,
                color: TrackingColors.primary,
              ),
              title: Text(place.text),
              subtitle: Text(place.placeName),
              onTap: () {
                final result = SearchResult(
                  cancel: false,
                  manual: false,
                  position: LatLng(place.center[1], place.center[0]),
                  name: place.text,
                  description: place.placeName,
                );
                close(context, result);
              },
            ))
      ],
    );
  }
}
