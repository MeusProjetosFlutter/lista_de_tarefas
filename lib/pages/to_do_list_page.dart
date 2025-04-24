import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/repositories/todo_repository.dart';
import 'package:lista_de_tarefas/widgets//todo_item_list.dart';
import 'package:lista_de_tarefas/models/todo.dart';

class ToDoListPage extends StatefulWidget {
  ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TextEditingController emailController = TextEditingController();
  final TodoRepository todoRepository =
      TodoRepository(); //criando um novo repositório

  List<Todo> todos = [];
  int count = 0;
  List<Todo> deletedTodos = [];
  Todo? deletedTodo;
  int? deletedTodoIndex;
  List<Todo> listBackup = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: "Tarefa",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          String text = emailController.text;
                          setState(() {
                            Todo newtodo = Todo(text,
                                DateTime.now()); // criando uma nova tarefa
                            todos.add(newtodo);
                            listBackup.add(newtodo);
                            todoRepository.saveTodoList(
                                listBackup); //salvo a lista no repositorio
                            //adicionando a tarefa na lista
                            count++;
                            emailController.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen[400],
                            padding: const EdgeInsets.all(20)),
                        child: const Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    //ListView serve para criar listas de Widgets
                    child: ListView(
                      //shrikWrap serve para aumentar a altura da ListView de acordo com a quantidade de itens nela
                      shrinkWrap: true,
                      children: [
                        for (Todo todo in todos) TodoListItem(todo, onDelete)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 7,
                          child: Text("Você possui $count tarefas pendentes")),
                      Expanded(
                          flex: 3,
                          child: ElevatedButton(
                              onPressed: count == 0
                                  ? () {
                                      //Restaurar tarefas
                                      setState(() {
                                        todos.addAll(listBackup);
                                        //deletedTodos.clear();

                                        count = todos.length;
                                      });
                                    }
                                  : () {
                                      showDeleteAllConfirmation();
                                    },
                              child: count == 0
                                  ? const Text("Restaurar Tarefas")
                                  : const Text("Limpar Tarefas"))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Todo todo) {
    setState(() {
      deletedTodo = todo;
      deletedTodoIndex = todos.indexOf(todo);
      deletedTodos.add(todo);
      todos.remove(todo);
      count--;
    });
    ScaffoldMessenger.of(context).clearSnackBars(); //Limpar snackbars
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //Mostrar mensagem de desfazer exlucsao da tarefa
      content: Text("A tarefa ${todo.title} foi removida com sucesso"),
      action: SnackBarAction(
          label: "Desfazer exclusão?",
          onPressed: () {
            setState(() {
              deletedTodos.remove(deletedTodo);
              todos.insert(deletedTodoIndex!, deletedTodo!);
              count++;
            });
          }),
    ));
  }

  void showDeleteAllConfirmation() {
    showDialog(
        //mostrar um dialogo na tela
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                "Limpar tudo?",
                textAlign: TextAlign.center,
              ),
              content: const Text(
                  "Você tem certeza que deseja excluir todas as tarefas?"),
              actions: [
                TextButton(
                    onPressed: () {
                      //Limpar tarefas
                      setState(() {
                        count = 0;
                        deletedTodos.addAll(todos);
                        todos.clear();
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text("Ok")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); //funcao para fechar dialogo da tela
                    },
                    child: const Text("Cancelar"))
              ],
            ));
  }
}
