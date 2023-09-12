// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funcionario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuncionarioModel _$FuncionarioModelFromJson(Map<String, dynamic> json) =>
    FuncionarioModel(
      funcionarioId: json['funcionarioId'] as int?,
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      cargo: json['cargo'] as String,
      salario: json['salario'] as String,
      admissao: json['admissao'] as String,
    );

Map<String, dynamic> _$FuncionarioModelToJson(FuncionarioModel instance) =>
    <String, dynamic>{
      'funcionarioId': instance.funcionarioId,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'cargo': instance.cargo,
      'salario': instance.salario,
      'admissao': instance.admissao,
    };
