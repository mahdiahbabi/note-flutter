part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

 

class HomeLoading extends HomeState{}

class HomeSuccess extends HomeState{

final  List<NoteEntity> noteList ;

  HomeSuccess({required this.noteList});

}


class HomeEror extends HomeState{

  final AppExeption appExeption ;

  HomeEror(this.appExeption); 
}