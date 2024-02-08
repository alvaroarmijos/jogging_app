import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/onboarding/bloc/bloc/onboarding_bloc.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bloc = context.read<OnboardingBloc>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(TrackingDimens.dimen_20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: TrackingDimens.dimen_12,
            ),
            Text(
              'Bienvenido!',
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: TrackingDimens.dimen_12,
            ),
            const Text(
              'Ingresa la siguiente información para poder calcular la cantidad de calorias que quemas en cada entrenamiento.',
            ),
            const SizedBox(
              height: TrackingDimens.dimen_20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nombre',
              ),
              textInputAction: TextInputAction.next,
              onChanged: (value) => bloc.add(ChangeNameEvent(value)),
            ),
            const SizedBox(
              height: TrackingDimens.dimen_12,
            ),
            BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    errorText: state.showErrorEmail
                        ? 'Ingrese un correo válido'
                        : null,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => bloc.add(ChangeEmailEvent(value)),
                );
              },
            ),
            const SizedBox(
              height: TrackingDimens.dimen_12,
            ),
            BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Edad',
                    errorText:
                        state.showErrorAge ? 'Ingrese una edad válida' : null,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => bloc.add(ChangeAgeEvent(value)),
                );
              },
            ),
            const SizedBox(
              height: TrackingDimens.dimen_12,
            ),
            BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Peso (kg)',
                    errorText: state.showErrorWeight
                        ? 'Ingrese un valor válido'
                        : null,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => bloc.add(ChangeWeightEvent(value)),
                );
              },
            ),
            const Spacer(),
            BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.showContinueButton
                      ? () => bloc.add(const NextButtonPressedEvent())
                      : null,
                  child: const Text('Continuar'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
