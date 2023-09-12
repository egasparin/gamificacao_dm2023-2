// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adicionais.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdicionaisModel _$AdicionaisModelFromJson(Map<String, dynamic> json) =>
    AdicionaisModel(
      adicionaisId: json['adicionaisId'] as int?,
      descricao: json['descricao'] as String,
      preco: json['preco'] as String,
    );

Map<String, dynamic> _$AdicionaisModelToJson(AdicionaisModel instance) =>
    <String, dynamic>{
      'adicionaisId': instance.adicionaisId,
      'descricao': instance.descricao,
      'preco': instance.preco,
    };
