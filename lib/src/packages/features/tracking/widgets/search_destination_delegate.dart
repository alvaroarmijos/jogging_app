import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';
import 'package:tracking_app/src/packages/features/tracking/models/search_result.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

class SearchDestinationDelegate extends SearchDelegate<SearchResult> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        final searchResult = SearchResult(cancel: true);
        close(context, searchResult);
      },
      icon: const Icon(Icons.navigate_before_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final lastKnowLocation =
        context.read<LocationBloc>().state.lastKnownLocation!;

    final searchBloc = context.read<SearchBloc>()
      ..add(GetPlacesEvent(lastKnowLocation, query));

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return ListView.separated(
        itemCount: state.places.length,
        itemBuilder: (context, index) {
          final place = state.places[index];

          return ListTile(
            leading: Icon(
              Icons.location_on_outlined,
              color: TrackingColors.primary,
            ),
            title: Text(place.text),
            subtitle: Text(place.placeName),
            onTap: () {
              final searchResult = SearchResult(
                cancel: false,
                position: LatLng(place.center[1], place.center[0]),
                name: place.text,
                description: place.placeName,
              );
              searchBloc.add(AddToHistoryEvent(place));
              close(context, searchResult);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    final history = searchBloc.state.history;

    return ListView(
      children: [
        ListTile(
          leading: Icon(
            Icons.location_on_outlined,
            color: TrackingColors.primary,
          ),
          title: const Text('Colocar la ubicación en el mapa'),
          onTap: () {
            final searchResult = SearchResult(cancel: false, manual: true);
            close(context, searchResult);
          },
        ),

        ...history.map((place) => ListTile(
              leading: Icon(
                Icons.location_on_outlined,
                color: TrackingColors.primary,
              ),
              title: Text(place.text),
              subtitle: Text(place.placeName),
              onTap: () {
                final searchResult = SearchResult(
                  cancel: false,
                  position: LatLng(place.center[1], place.center[0]),
                  name: place.text,
                  description: place.placeName,
                );
                // searchBloc.add(AddToHistoryEvent(place));
                close(context, searchResult);
              },
            )),

        // for (var i = 0; i < history.length; i++)
        //   ListTile(
        //     leading: Icon(
        //       Icons.location_on_outlined,
        //       color: TrackingColors.primary,
        //     ),
        //     title: Text(history[i].text),
        //     subtitle: Text(history[i].placeName),
        //     onTap: () {
        //       final searchResult = SearchResult(
        //         cancel: false,
        //         position: LatLng(history[i].center[1], history[i].center[0]),
        //         name: history[i].text,
        //         description: history[i].placeName,
        //       );
        //       searchBloc.add(AddToHistoryEvent(history[i]));
        //       close(context, searchResult);
        //     },
        //   )
      ],
    );
  }
}
