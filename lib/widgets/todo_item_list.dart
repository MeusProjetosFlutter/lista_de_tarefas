import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_de_tarefas/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem(this.todo, this.onDelete, {super.key});

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Slidable(
         endActionPane:  ActionPane(motion: BehindMotion(), children: [
          SlidableAction(
            spacing: 0,
            flex: 2,
            onPressed: (context) {onDelete(todo);},
            backgroundColor: const Color(0xFFFA0000),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Excluir',
            //borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ]),
        child: Container(
          //margin: const EdgeInsets.symmetric(vertical: 1),
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              //borderRadius: BorderRadius.circular(20)
          ),
          //margin: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat("dd/MM/yyyy - EEEE", "pt_BR")
                  .format(todo.dateTime)
                  .replaceRange(
                    13, // Posição da primeira letra do dia da semana
                    14, // Uma posição após
                    DateFormat("EEEE", "pt_BR")
                        .format(todo.dateTime)[0]
                        .toUpperCase(),
                  )),
              Text(todo.title),
            ],
          ),
        ),

      ),
    );
  }
}
