import 'package:flutter/material.dart';

class StatusQuartoField extends StatelessWidget {
  final TextEditingController controller;

  const StatusQuartoField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      // tem que alterar para uma forma de selecao entre disponivel e não
      decoration: const InputDecoration(labelText: 'Status'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o status';
        }
        return null;
      },
    );
  }
}
