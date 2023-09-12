import 'package:flutter/material.dart';

class TipoQuartoField extends StatelessWidget {
  final TextEditingController controller;

  const TipoQuartoField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Classe'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira a classe do quarto';
        }
        return null;
      },
    );
  }
}
