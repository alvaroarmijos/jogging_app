import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();

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
                  "Ingresa la siguiente información para poder calcular la cantidad de calorias que quemas en cada entrenamiento."),
              const SizedBox(
                height: TrackingDimens.dimen_20,
              ),
              TextFormField(
                focusNode: _nameFocusNode,
                decoration: const InputDecoration(
                  hintText: "Nombre",
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(
                height: TrackingDimens.dimen_20,
              ),
              TextFormField(
                focusNode: _ageFocusNode,
                decoration: const InputDecoration(
                  hintText: "Edad",
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: TrackingDimens.dimen_20,
              ),
              TextFormField(
                focusNode: _weightFocusNode,
                decoration: const InputDecoration(
                  hintText: "Peso (kg)",
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: null,
              child: Text("Continuar"),
            ),
          )
        ],
      ),
    ));
  }
}
