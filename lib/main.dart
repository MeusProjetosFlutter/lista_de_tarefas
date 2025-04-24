import "package:flutter/material.dart";
import 'package:lista_de_tarefas/pages/to_do_list_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ], supportedLocales: const [
      Locale('pt', 'BR')
    ], home: ToDoListPage());
  }
}
