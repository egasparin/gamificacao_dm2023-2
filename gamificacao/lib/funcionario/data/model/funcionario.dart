// ignore_for_file: must_be_immutable

import '../../domain/funcionario.dart';
import 'package:json_annotation/json_annotation.dart';

part 'funcionario.g.dart';

@JsonSerializable()
class FuncionarioModel extends FuncionarioEntity {
  FuncionarioModel(
      {super.funcionarioId,
      required super.nome,
      required super.sobrenome,
      required super.cargo,
      required super.salario,
      required super.admissao});

  factory FuncionarioModel.fromJson(Map<String, dynamic> json) =>
      _$FuncionarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$FuncionarioModelToJson(this);
}
