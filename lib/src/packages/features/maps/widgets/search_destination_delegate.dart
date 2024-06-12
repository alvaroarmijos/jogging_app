import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';
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
    return const Text('buildResults');
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
