import 'package:flutter/material.dart';

class SaidaReservaField extends StatelessWidget {
  final TextEditingController controller;

  const SaidaReservaField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(labelText: 'Data de Saida'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, informe a data';
        }
        return null;
      },
    );
  }
}
