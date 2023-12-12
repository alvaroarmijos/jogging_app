import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/widgets/widgets.dart';

class SearchBarIcon extends StatelessWidget {
  const SearchBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () async {
          final result = await showSearch(
              context: context, delegate: SerchDestinationDelegate());
          if (result == null) return;
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(TrackingDimens.dimen_8),
          margin: const EdgeInsets.all(TrackingDimens.dimen_12),
          child: const Icon(Icons.search),
        ),
      ),
    ));
  }
}
