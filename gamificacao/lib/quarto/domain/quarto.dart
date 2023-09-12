import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class QuartoEntity extends Equatable {
  late int? quartoId;
  final String numero;
  final String tipo;
  final String status;
  final String preco;

  QuartoEntity({
    this.quartoId,
    required this.numero,
    required this.tipo,
    required this.status,
    required this.preco,
  });

  @override
  List<Object?> get props => [quartoId];

  String get numeroTipo => '$numero $tipo';
}
