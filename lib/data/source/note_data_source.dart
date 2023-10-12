import 'dart:developer';

import 'package:hive/hive.dart';

import '../note.dart';

abstract class INoteDataSource {
  Future<List<NoteEntity>> noteList();

  deleteAll();

  deleteone(int index);
  addOne(String title, String detail);
  edit({required int index, required NoteEntity value});
}

class LocalNoteDataSource implements INoteDataSource {
  final Box<NoteEntity> box;

  LocalNoteDataSource({required this.box});
  @override
  addOne(String title, String detail) {
    box.add(NoteEntity(details: detail, title: title));
  }

  @override
  deleteAll() {
   box.clear();
  }

  @override
  deleteone(int index) {
    box.deleteAt(index);
  }

  @override
  Future<List<NoteEntity>> noteList() async {
    var allValue = await box.values.toList();
    log(allValue.toString());
    return allValue;
  }

  @override
  edit({required int index, required NoteEntity value}) {
    box.putAt(index, value);
  }
}
