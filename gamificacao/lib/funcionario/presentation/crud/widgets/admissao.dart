import 'package:flutter/material.dart';

class AdmissaoFuncionarioField extends StatelessWidget {
  final TextEditingController controller;

  const AdmissaoFuncionarioField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.go,
      decoration: const InputDecoration(labelText: 'Admissao'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira a data de admissao';
        }
        return null;
      },
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
