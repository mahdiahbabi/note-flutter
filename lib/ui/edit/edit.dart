// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/data/note.dart';
import 'package:note/data/repository/note_repository.dart';
import 'package:note/ui/home/bloc/home_bloc.dart';

import '../../common/string.dart';

class Edit extends StatelessWidget {
  final NoteEntity note;
  final int indexNote;
  final INoteRepository noterepository;
  late final TextEditingController titleController;
  late final TextEditingController detailController;

  Edit({Key? key, required this.noterepository, required this.note, required this.indexNote})
      : super(key: key) {
    titleController = TextEditingController(text: note.title);
    detailController = TextEditingController(text: note.details);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                NoteEntity note = NoteEntity(details: detailController.text, title: titleController.text);
                await noterepository.edit(
                  
                  index: indexNote , value: note    );

                context.read<HomeBloc>().add(HomeStarted());
                Navigator.pop(context);
              },
              label: const Text(StringText.editText)),
          body: SafeArea(
            child: Column(children: [
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: detailController,
                  decoration: InputDecoration(
                      labelText: 'detail',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
            ]),
          ));
    });
  }
}
