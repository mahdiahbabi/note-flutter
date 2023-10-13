// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/common/string.dart';
import 'package:note/data/note.dart';
import 'package:note/ui/detail.dart/detail.dart';
import 'package:note/ui/edit/edit.dart';
import 'package:note/ui/home/bloc/home_bloc.dart';

import '../../data/repository/note_repository.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width / 5.8,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailScreen(noterepository: noteReposytory),
              ));
            },
            child: const Icon(Icons.add),
          )),
      appBar: AppBar(
        title: const Text(StringText.appBarTitle),
        actions: [
          TextButton(
              onPressed: () async {
                await noteReposytory.deleteAll();
                (context).read<HomeBloc>().add(HomeStarted());
              },
              child: const Text(StringText.textButtonDelete))
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          // check box empty
          if (boxNot.isEmpty) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // color: Colors.amber,
              child: Image.asset('asset/img/cartoon-pencil.jpg'),
            );
          } else if (state is HomeSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.noteList.length,
              itemBuilder: (context, index) {
                return _NoteItems(
                  indexNote: index,
                  note: state.noteList[index],
                );
              },
            );
          }
          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}

class _NoteItems extends StatelessWidget {
  final int indexNote;
  final NoteEntity note;
  const _NoteItems({
    required this.indexNote,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Edit(
                noterepository: noteReposytory,
                note: note,
                indexNote: indexNote,
              ),
            ));
      },
      focusColor: const Color.fromARGB(255, 20, 218, 198),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.shade300),
              // gradient: const LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: <Color>[
              //       Color.fromARGB(255, 239, 165, 235),
              //       Colors.white30
              //     ]),
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(75, 7, 226, 255)),

          height: 70,
          width: double.infinity,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      note.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      note.details,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(HomeDelete(index: indexNote));
                  },
                  icon: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
