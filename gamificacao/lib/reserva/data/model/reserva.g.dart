// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserva.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservaModel _$ReservaModelFromJson(Map<String, dynamic> json) => ReservaModel(
      reservaId: json['reservaId'] as int?,
      dataEntrada: json['dataEntrada'],
      dataSaida: json['dataSaida'],
      hospedeSelected: json['hospedeSelected']as int,
      quartoSelected: json['quartoSelected'] as int,
    );

Map<String, dynamic> _$ReservaModelToJson(ReservaModel instance) =>
    <String, dynamic>{
      'reservaId': instance.reservaId,
      'dataEntrada': instance.dataEntrada,
      'dataSaida': instance.dataSaida,
      'hospedeSelected': instance.hospedeSelected,
      'quartoSelected': instance.quartoSelected,
    };
