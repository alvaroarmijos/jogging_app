import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listenWhen: (previous, current) => previous.loading != current.loading,
      listener: _listenState,
      builder: (context, state) {
        return (state.showManulMarker)
            ? const _ManualMarkerView()
            : const SizedBox();
      },
    );
  }

  void _listenState(BuildContext context, SearchState state) {
    if (state.loading) {
      showLoadingMessage(context);
    } else {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}

class _ManualMarkerView extends StatelessWidget {
  const _ManualMarkerView();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final searchBloc = context.read<SearchBloc>();
    final locationBloc = context.read<LocationBloc>();
    final mapBloc = context.read<MapBloc>();

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          _BtnBack(
            onPressed: () => searchBloc.add(const ShowManualMarkerEvent(false)),
          ),
          Center(
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: BounceInDown(
                child: Icon(
                  Icons.location_on_rounded,
                  size: 50,
                  color: TrackingColors.primary,
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: FadeInUp(
                duration: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: TrackingDimens.dimen_32,
                    horizontal: TrackingDimens.dimen_24,
                  ),
                  child: ElevatedButton(
                    child: const Text("Confirmar"),
                    onPressed: () {
                      final start = locationBloc.state.lastKownLocation;
                      if (start == null) return;

                      final end = mapBloc.mapCenter;
                      if (end == null) return;

                      searchBloc.add(GetRouteEvent(start, end));
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack({
    required this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 300),
      child: SafeArea(
        child: CircleAvatar(
          maxRadius: TrackingDimens.dimen_24,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: TrackingColors.primary,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
