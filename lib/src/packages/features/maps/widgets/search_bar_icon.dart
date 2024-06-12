import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';
import 'package:tracking_app/src/packages/core/ui/dimens.dart';
import 'package:tracking_app/src/packages/features/maps/model/search_result.dart';
import 'package:tracking_app/src/packages/features/maps/search_bloc/search_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/widgets/widgets.dart';

class SearchbarIcon extends StatelessWidget {
  const SearchbarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    void onSearchResult(BuildContext context, SearchResult searchResult) {
      final searchBloc = context.read<SearchBloc>();

      if (searchResult.manual) {
        searchBloc.add(const ShowManualMarkerEvent(true));
      }
    }

    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () async {
          final result = await showSearch(
            context: context,
            delegate: SearchDestionationDelegate(),
          );

          if (result != null) onSearchResult(context, result);
        },
        child: Container(
          padding: const EdgeInsets.all(AppDimens.dimen_12),
          margin: const EdgeInsets.all(AppDimens.dimen_24),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            Icons.search,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
