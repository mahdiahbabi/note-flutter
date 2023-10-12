import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/ui/home/bloc/home_bloc.dart';
import 'package:note/ui/home/home.dart';
import 'data/note.dart';
import 'data/repository/note_repository.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteEntityAdapter());
  var box = await Hive.openBox<NoteEntity>('testBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homebloc = HomeBloc(inoterepository: noteReposytory);
        homebloc.add(HomeStarted());
        return homebloc;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Home(),
      ),
    );
  }
}
