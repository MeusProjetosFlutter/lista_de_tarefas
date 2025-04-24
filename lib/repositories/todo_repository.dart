import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:lista_de_tarefas/models/todo.dart';

class TodoRepository {
  //classe usada para armazenar as tarefas quando o app for fechado
  TodoRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences =
        value); //espera uma instancia do SharedPreferences e depois passa para o atributo sharedPreferences
  }

  late SharedPreferences
      sharedPreferences; //armazena dados pesquenos como String, inteiros etc

  void saveTodoList(List<Todo> todos) {
    final String jsonString = json.encode(
        todos); /*pega um mapa OU uma lista de instancias de uma classe que implementa o metodo toJSON, e converte para o padrao JSON
        OBS: a lista "todos" contém objetos da classe TODO,
        a qual implementa o métod toJson. Isso é suficiente para que o json.encode saiba como converter cada objeto Todo para JSON.*/
    sharedPreferences.setString("todo_list",
        jsonString); //armazena/salva o texto no padrão JSON em um MAP
  }
}
