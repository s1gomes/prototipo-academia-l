

import 'package:acad_prot/data/models/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];
  Future<void> adicionarTarefa(Tarefa tarefa) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas.where((tarefa) => tarefa.id == id).first.concluido = concluido;
  }
  
  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas.remove(_tarefas.where((tarefa) => tarefa.id == id).first);
  }

  Future<List<Tarefa>> listarTarefa() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefas;
  }
  
  Future<List<Tarefa>> listarNaoConcluido() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefas.where((tarefa) => !tarefa.concluido).toList();
  }

}