
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/common/exeption.dart';
import 'package:note/data/note.dart';
import 'package:note/data/repository/note_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final INoteRepository inoterepository;
  HomeBloc({required this.inoterepository}) : super(HomeLoading()) {
    
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted ) {
       try {
      //  await inoterepository.addOne();
     final List<NoteEntity> note = await inoterepository.noteList();
     log(note.toString());
       emit(HomeSuccess(noteList: note));
       } catch (e) {
         emit(HomeEror(AppExeption(message: 'خطای نامشخص')));
       }
      }else if(event is HomeDelete){
        try {
           await inoterepository.deleteone(event.index); // Use the index from the event
          final List<NoteEntity> note = await inoterepository.noteList();
          emit(HomeSuccess(noteList: note));
        } catch (e) {
           emit(HomeEror(AppExeption(message: 'خطای نامشخص')));
        }
      }
    });
  }
}
