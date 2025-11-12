import "package:flutter/material.dart";
import 'package:lista_de_tarefas/pages/to_do_list_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ], supportedLocales: [
      Locale('pt', 'BR')
    ], home: ToDoListPage());
  }
}
