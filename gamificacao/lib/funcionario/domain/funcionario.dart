import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FuncionarioEntity extends Equatable {
  
  late int? funcionarioId;
  final String nome;
  final String sobrenome;
  final String cargo;
  final String salario;
  final String admissao;

  FuncionarioEntity({
    this.funcionarioId,
    required this.nome,
    required this.sobrenome,
    required this.cargo,
    required this.salario,
    required this.admissao,
  });

  @override
  List<Object?> get props => [funcionarioId];

  String get nomeCompleto => '$nome $sobrenome';
}
