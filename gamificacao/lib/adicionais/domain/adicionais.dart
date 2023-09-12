import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AdicionaisEntity extends Equatable {
  late int? adicionaisId;
  final String descricao;
  final String preco;

  AdicionaisEntity({
    this.adicionaisId,
    required this.descricao,
    required this.preco,
  });

  @override
  List<Object?> get props => [adicionaisId];

  String get servicoEPreco => '$descricao - $preco';
}
