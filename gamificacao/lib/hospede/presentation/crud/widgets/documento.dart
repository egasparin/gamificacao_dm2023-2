import 'package:flutter/material.dart';

class CargoHospedeField extends StatelessWidget {
  final TextEditingController controller;

  const CargoHospedeField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'CPF'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o numero do CPF';
        }
        return null;
      },
    );
  }
}
