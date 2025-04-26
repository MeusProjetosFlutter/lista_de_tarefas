class Todo {
  Todo(this.title, this.dateTime);

  String title;
  DateTime dateTime;





  Map<String, dynamic> toJson() { //método que permite converter a tarefa e seus atributos para JSON
    return {
      "title": title,
      "dateTime" : dateTime.toIso8601String(), //converte a data em um formato de String
    };
  }
}
