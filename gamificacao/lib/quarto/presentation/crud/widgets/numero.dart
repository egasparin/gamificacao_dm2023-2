import 'package:flutter/material.dart';

class NumeroQuartoField extends StatelessWidget {
  final TextEditingController controller;

  const NumeroQuartoField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Numero'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o número do quarto';
        }
        return null;
      },
    );
  }
}
