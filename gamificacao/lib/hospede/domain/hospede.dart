import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class HospedeEntity extends Equatable {
  late int? hospedeId;
  final String nome;
  final String sobrenome;
  final String documento;
  final String contato;

  HospedeEntity({
    this.hospedeId,
    required this.nome,
    required this.sobrenome,
    required this.documento,
    required this.contato,
  });

  @override
  List<Object?> get props => [hospedeId];

  String get nomeCompleto => '$nome $sobrenome';
}
