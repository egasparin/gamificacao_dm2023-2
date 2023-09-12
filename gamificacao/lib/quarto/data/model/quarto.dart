// ignore_for_file: must_be_immutable

import '../../domain/quarto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quarto.g.dart';

@JsonSerializable()
class QuartoModel extends QuartoEntity {
  QuartoModel({
    super.quartoId,
    required super.numero,
    required super.tipo,
    required super.status,
    required super.preco,
  });

  factory QuartoModel.fromJson(Map<String, dynamic> json) =>
      _$QuartoModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuartoModelToJson(this);
}
