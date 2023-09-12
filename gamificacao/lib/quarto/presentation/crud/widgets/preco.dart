import 'package:flutter/material.dart';

class PrecoQuartoField extends StatelessWidget {
  final TextEditingController controller;

  const PrecoQuartoField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(labelText: 'Preço'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o preço';
        }
        return null;
      },
    );
  }
}
