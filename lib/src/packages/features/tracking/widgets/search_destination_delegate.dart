import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/models/search_result.dart';

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
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
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
        )
      ],
    );
  }
}
