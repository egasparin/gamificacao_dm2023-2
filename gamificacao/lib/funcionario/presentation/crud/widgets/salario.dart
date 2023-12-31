import 'package:flutter/material.dart';

class SalarioFuncionarioField extends StatelessWidget {
  final TextEditingController controller;

  const SalarioFuncionarioField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.go,
      decoration: const InputDecoration(labelText: 'Salario'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o salario';
        }
        return null;
      },
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
