import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/maps/search_bloc/search_bloc.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return state.showManualMarker
          ? const ManualMarkerView()
          : const SizedBox();
    });
  }
}

class ManualMarkerView extends StatelessWidget {
  const ManualMarkerView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return Stack(
      children: [
        SafeArea(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                searchBloc.add(const ShowManualMarkerEvent(false));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: const Offset(0, -22),
            child: Icon(
              Icons.location_on_rounded,
              size: AppDimens.dimen_48,
              color: AppColors.primary,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimens.dimen_24,
              horizontal: AppDimens.dimen_32,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Confirmar'),
            ),
          ),
        )
      ],
    );
  }
}
