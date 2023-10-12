// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/common/string.dart';
import 'package:note/ui/detail.dart/detail.dart';
import 'package:note/ui/edit/edit.dart';
import 'package:note/ui/home/bloc/home_bloc.dart';

import '../../data/repository/note_repository.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width - 80,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => detail(noterepository: noteReposytory),
              ));
            },
            child: const Text(StringText.newText),
          )),
      appBar: AppBar(
        actions: [IconButton(onPressed: ()async{
await noteReposytory.deleteAll();
(context).read<HomeBloc>().add(HomeStarted());

        }, icon: const Icon(Icons.delete))],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
        
          if(boxNot.isEmpty){
            return Container(
              color: Colors.amber,
              child:  const Text('box is empyty'),
            );
          }else  if (state is HomeSuccess) {
            return ListView.builder(
              itemCount: state.noteList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Edit(
                            noterepository: noteReposytory,
                            note: state.noteList[index], indexNote: index,
                            
                          ),
                        ));
                  },
                  focusColor: Colors.amber,
                  child: Container(
                    height: 70,
                    width: 90,
                    color: Colors.red,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              context
                                  .read<HomeBloc>()
                                  .add(HomeDelete(index: index));
                            },
                            icon: const Icon(Icons.delete)),
                        Text(state.noteList[index].title),
                      ],
                    ),
                  ),
                );
              },
            );
          } 
          return Container(color: Colors.red,);
        },
      ),
    );
  }
}
