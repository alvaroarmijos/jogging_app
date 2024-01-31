import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

class ManualMaker extends StatelessWidget {
  const ManualMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
        listenWhen: (previous, current) => previous.loading != current.loading,
        listener: _listenState,
        builder: (context, state) {
          return (state.showManualMarker)
              ? const _ManualMakerView()
              : const SizedBox();
        });
  }

  void _listenState(BuildContext context, SearchState state) {
    if (state.loading) {
      showLoadingMessage(context);
    } else {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}

class _ManualMakerView extends StatelessWidget {
  const _ManualMakerView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final searchBloc = context.read<SearchBloc>();
    final locationBloc = context.read<LocationBloc>();
    final mapBloc = context.read<MapBloc>();

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          _BtnBack(
            onTap: () => searchBloc.add(const ShowManualMarkerEvent(false)),
          ),
          Center(
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: BounceInDown(
                child: Icon(
                  Icons.location_on_rounded,
                  size: TrackingDimens.dimen_48,
                  color: TrackingColors.primary,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: TrackingDimens.dimen_32,
                horizontal: TrackingDimens.dimen_24,
              ),
              child: ElevatedButton(
                onPressed: () {
                  final start = locationBloc.state.lastKnownLocation;

                  if (start == null) return;

                  final end = mapBloc.mapCenter;

                  if (end == null) return;

                  searchBloc.add(GetRouteEvent(start, end));
                },
                child: const Text('Confirmar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  final VoidCallback? onTap;

  const _BtnBack({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 300),
      child: SafeArea(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.arrow_back_ios,
              color: TrackingColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
