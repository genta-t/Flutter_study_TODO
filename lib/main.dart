import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_01/main_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOアプリ',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel()..getTodoList(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TODOアプリ'),
          ),
          body: Consumer<MainModel>(builder: (context, model, clild) {
            final todolist = model.todoList;
            return ListView(
              children: todolist.map(
                (todo) => ListTile(
                  title: Text(todo.title),
                )
                .toList(),
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}


