import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/location_bloc/location_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/search_bloc/search_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/model/search_result.dart';

class SearchDestionationDelegate extends SearchDelegate<SearchResult> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, SearchResult(manual: false, cancel: true));
      },
      icon: const Icon(Icons.navigate_before_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final lastKnowLocation =
        context.read<LocationBloc>().state.lastKnownLocation;

    if (lastKnowLocation == null) return const SizedBox();

    context.read<SearchBloc>().add(GetPlacesEvent(lastKnowLocation, query));

    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state.places == null) return const SizedBox();

      return ListView.builder(
        itemCount: state.places!.length,
        itemBuilder: (context, index) {
          final place = state.places![index];

          return ListTile(
            title: Text(place.text),
            subtitle: Text(place.placeName),
            leading: Icon(
              Icons.location_on_outlined,
              color: AppColors.primary,
            ),
            onTap: () {
              final searchResult = SearchResult(
                  manual: false,
                  cancel: false,
                  position: LatLng(
                    place.center[1],
                    place.center[0],
                  ),
                  name: place.text,
                  description: place.placeName);
              close(
                context,
                searchResult,
              );
            },
          );
        },
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.location_on_rounded,
        color: AppColors.primary,
      ),
      title: const Text('Colocar la ubicación en el mapa'),
      onTap: () {
        close(context, SearchResult(manual: true));
      },
    );
  }
}
