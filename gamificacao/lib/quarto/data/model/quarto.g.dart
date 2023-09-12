// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quarto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuartoModel _$QuartoModelFromJson(Map<String, dynamic> json) => QuartoModel(
      quartoId: json['quartoId'] as int?,
      numero: json['numero'] as String,
      tipo: json['tipo'] as String,
      status: json['status'] as String,
      preco: json['preco'] as String,
    );

Map<String, dynamic> _$QuartoModelToJson(QuartoModel instance) =>
    <String, dynamic>{
      'quartoId': instance.quartoId,
      'numero': instance.numero,
      'tipo': instance.tipo,
      'status': instance.status,
      'preco': instance.preco,
    };
