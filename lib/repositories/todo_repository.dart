import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:lista_de_tarefas/models/todo.dart';


String todoListKey = "todo_list";

class TodoRepository {

  late SharedPreferences
      sharedPreferences; //armazena dados pesquenos como String, inteiros etc

  void saveTodoList(List<Todo> todos) {
    //convertendo a lista de tarefas em um JSON
    final String jsonString = json.encode(
        todos); /*pega um mapa OU uma lista de instancias de uma classe que implementa o metodo toJSON, e converte para o padrao JSON
        OBS: a lista "todos" contém objetos da classe TODO,
        a qual implementa o metodo toJson. Isso é suficiente para que o json.encode saiba como converter cada objeto Todo para JSON.*/
    //SALVANDO O JSON EM UMA STRING NO SHAREDPREFERENCES
    print(jsonString);
    sharedPreferences.setString("todo_list",
        jsonString); // armazena/salva o texto no padrão JSON em um MAP
  }

  Future <List <Todo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? jsonString = sharedPreferences.getString(todoListKey) ??
        "[]"; //se nenhuma lista foi salva, retorna um json com uma lista vazia
    List jsonDecoded = json.decode(jsonString)
        as List; //convertendo o json decodificado para uma lista
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }
}
