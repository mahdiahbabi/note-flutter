


import 'package:hive_flutter/adapters.dart';

 part 'note.g.dart';
 
@HiveType(typeId: 0)
class NoteEntity  {
  // @HiveField(0)
  // int id  ;
  @HiveField(0)
  String title ;
  @HiveField(1)
  String details ;
  NoteEntity({  required this.details , required this.title});
  
}