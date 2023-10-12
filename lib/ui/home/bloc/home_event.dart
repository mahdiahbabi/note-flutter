part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}




class HomeStarted extends HomeEvent{}

class HomeDelete extends HomeEvent{
  final int index ;

  HomeDelete({required this.index});
}


