import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/core/ui/widgets/widgets.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/location_bloc/location_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/map_bloc/map_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/search_bloc/search_bloc.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading,
      listener: _listenState,
      builder: (context, state) {
        return state.showManualMarker
            ? const ManualMarkerView()
            : const SizedBox();
      },
    );
  }

  void _listenState(BuildContext context, SearchState state) {
    if (state.directions != null) {
      context.read<MapBloc>().add(AddPolylineDirectionEvent(state.directions!));
    }

    if (state.isLoading) {
      showLoadingMessage(context);
    } else {
      Navigator.maybePop(context);
    }
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
            child: BounceInDown(
              child: Icon(
                Icons.location_on_rounded,
                size: AppDimens.dimen_48,
                color: AppColors.primary,
              ),
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
              onPressed: () {
                final start =
                    context.read<LocationBloc>().state.lastKnownLocation;

                if (start == null) return;

                final end = context.read<MapBloc>().mapCenter;

                if (end == null) return;

                searchBloc.add(GetRouteEvent(start, end));
              },
              child: const Text('Confirmar'),
            ),
          ),
        )
      ],
    );
  }
}
