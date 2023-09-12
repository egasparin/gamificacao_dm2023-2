// ignore_for_file: must_be_immutable

import '../../domain/hospede.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospede.g.dart';

@JsonSerializable()
class HospedeModel extends HospedeEntity {
  HospedeModel({
    super.hospedeId,
    required super.nome,
    required super.sobrenome,
    required super.documento,
    required super.contato,
  });

  factory HospedeModel.fromJson(Map<String, dynamic> json) =>
      _$HospedeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HospedeModelToJson(this);
}
