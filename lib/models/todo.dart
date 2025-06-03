class Todo {
  Todo({required this.title, required this.dateTime});

  Todo.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        dateTime = DateTime.parse(json["dateTime"]);

  String title;
  DateTime dateTime;

  Map<String, dynamic> toJson() {
    //metodo que permite converter a tarefa e seus atributos para JSON
    return {
      "title": title,
      "dateTime": dateTime.toIso8601String(),
      //converte a data em um formato de String
    };
  }
}
