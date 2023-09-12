// ignore_for_file: must_be_immutable

import '../../domain/adicionais.dart';
import 'package:json_annotation/json_annotation.dart';

part 'adicionais.g.dart';

@JsonSerializable()
class AdicionaisModel extends AdicionaisEntity {
  AdicionaisModel({
    super.adicionaisId,
    required super.descricao,
    required super.preco,
  });

  factory AdicionaisModel.fromJson(Map<String, dynamic> json) =>
      _$AdicionaisModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdicionaisModelToJson(this);
}
