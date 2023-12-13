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
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () async {
            final result = await showSearch(
                context: context, delegate: SerchDestinationDelegate());
            if (result == null) return;
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
