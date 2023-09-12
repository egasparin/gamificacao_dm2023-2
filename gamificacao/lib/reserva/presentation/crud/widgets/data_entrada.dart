import 'package:flutter/material.dart';

class EntradaReservaField extends StatelessWidget {
  final TextEditingController controller;

  const EntradaReservaField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Data de Entrada'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, informe a data de entrada';
        }
        return null;
      },
    );
  }
}
