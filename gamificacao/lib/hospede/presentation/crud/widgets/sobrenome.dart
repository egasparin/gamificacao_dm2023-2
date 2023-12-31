import 'package:flutter/material.dart';

class SobrenomeHospedeField extends StatelessWidget {
  final TextEditingController controller;

  const SobrenomeHospedeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Sobrenome'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o sobrenome';
        }
        return null;
      },
    );
  }
}
