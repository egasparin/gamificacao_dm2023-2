import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ReservaEntity extends Equatable {
  late int? reservaId;
  final String dataEntrada;
  final String dataSaida;

  ReservaEntity({
    this.reservaId,
    required this.dataEntrada,
    required this.dataSaida,
  });

  @override
  List<Object?> get props => [reservaId];
}
