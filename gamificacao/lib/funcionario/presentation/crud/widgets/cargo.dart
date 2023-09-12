import 'package:flutter/material.dart';

class CargoFuncionarioField extends StatelessWidget {
  final TextEditingController controller;

  const CargoFuncionarioField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Cargo'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o endereço';
        }
        return null;
      },
    );
  }
}
