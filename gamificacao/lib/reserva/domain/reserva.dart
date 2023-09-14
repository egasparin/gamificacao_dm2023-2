import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ReservaEntity extends Equatable {
  late int? reservaId;
  final String dataEntrada;
  final String dataSaida;
  final int? idHospede;
  final int? idQuarto;

  ReservaEntity({
    this.reservaId,
    required this.dataEntrada,
    required this.dataSaida,
    required this.idHospede,
    required this.idQuarto,
  });

  @override
  List<Object?> get props => [reservaId];
}
