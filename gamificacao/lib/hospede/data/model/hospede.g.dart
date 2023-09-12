// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospede.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospedeModel _$HospedeModelFromJson(Map<String, dynamic> json) => HospedeModel(
      hospedeId: json['hospedeId'] as int?,
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      documento: json['documento'] as String,
      contato: json['contato'] as String,
    );

Map<String, dynamic> _$HospedeModelToJson(HospedeModel instance) =>
    <String, dynamic>{
      'hospedeId': instance.hospedeId,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'documento': instance.documento,
      'contato': instance.contato,
    };
