import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/onboarding/onboarding.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();

  late final OnboardingBloc bloc;

  @override
  void initState() {
    bloc = context.read<OnboardingBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(TrackingDimens.dimen_20),
      child: Stack(
        children: [
          ListView(
            children: [
              Text(
                "Bienvenido!",
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: TrackingDimens.dimen_12,
              ),
              const Text(
                  "La siguiente información es necesaria para calcular la cantidad de calorías quemadas durante cada sesión de entrenamiento."),
              const SizedBox(
                height: TrackingDimens.dimen_20,
              ),
              TextFormField(
                focusNode: _nameFocusNode,
                decoration: const InputDecoration(
                  label: Text("Nombre"),
                  hintText: "Nombre",
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                onChanged: (value) => bloc.add(ChangeNameEvent(value)),
              ),
              const SizedBox(
                height: TrackingDimens.dimen_20,
              ),
              BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  return TextFormField(
                    focusNode: _ageFocusNode,
                    decoration: InputDecoration(
                      label: const Text("Edad"),
                      hintText: "Edad",
                      errorText:
                          state.showErrorAge ? "Ingrese un valor válido" : null,
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => bloc.add(ChangeAgeEvent(value)),
                  );
                },
              ),
              const SizedBox(
                height: TrackingDimens.dimen_20,
              ),
              BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  return TextFormField(
                    focusNode: _weightFocusNode,
                    decoration: InputDecoration(
                      label: const Text("Peso (kg)"),
                      hintText: "Peso (kg)",
                      errorText: state.showErrorWeight
                          ? "Ingrese un valor válido"
                          : null,
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => bloc.add(ChangeWeightEvent(value)),
                    onFieldSubmitted: (_) => state.isNextButtonEnabled
                        ? bloc.add(const NextButtonPressedEvent())
                        : null,
                  );
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.isNextButtonEnabled
                      ? () => bloc.add(const NextButtonPressedEvent())
                      : null,
                  child: const Text("Continuar"),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
