import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          const _BtnBack(),
          Center(
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: BounceInDown(
                child: const Icon(
                  Icons.location_on_rounded,
                  size: 50,
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
                    onPressed: () {},
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack();

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
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
