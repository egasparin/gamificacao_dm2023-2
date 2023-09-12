// ignore_for_file: must_be_immutable

import '../../domain/reserva.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reserva.g.dart';

@JsonSerializable()
class ReservaModel extends ReservaEntity {
  final List quartos;
  final List hospedes;

  ReservaModel({
    int? reservaId,
    required dataEntrada,
    required dataSaida,
    required this.hospedes,
    required this.quartos,
  }) : super(
          reservaId: reservaId,
          dataEntrada: dataEntrada,
          dataSaida: dataSaida,
        );

  factory ReservaModel.fromJson(Map<String, dynamic> json) =>
      _$ReservaModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservaModelToJson(this);
}
