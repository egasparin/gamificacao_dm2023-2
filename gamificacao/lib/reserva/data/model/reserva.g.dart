// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserva.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservaModel _$ReservaModelFromJson(Map<String, dynamic> json) => ReservaModel(
      reservaId: json['reservaId'] as int?,
      dataEntrada: json['dataEntrada'],
      dataSaida: json['dataSaida'],
      hospedes: json['hospedes'] as List<dynamic>,
      quartos: json['quartos'] as List<dynamic>,
    );

Map<String, dynamic> _$ReservaModelToJson(ReservaModel instance) =>
    <String, dynamic>{
      'reservaId': instance.reservaId,
      'dataEntrada': instance.dataEntrada,
      'dataSaida': instance.dataSaida,
      'quartos': instance.quartos,
      'hospedes': instance.hospedes,
    };
