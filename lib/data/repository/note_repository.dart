import 'package:hive/hive.dart';
import 'package:note/data/source/note_data_source.dart';

import '../note.dart';

Box<NoteEntity> boxNot = Hive.box('testBox');

final noteReposytory =
    NoteReposytory(dataSource: LocalNoteDataSource(box: boxNot));

abstract class INoteRepository {
  Future<List<NoteEntity>> noteList();

  deleteAll();
  deleteone(int index);
  addOne(String title, String detail);
  edit({required int index, required NoteEntity value});
}

class NoteReposytory implements INoteRepository {
  final INoteDataSource dataSource;

  NoteReposytory({required this.dataSource});
  @override
  addOne(String title, String detail) {
    dataSource.addOne(title, detail);
  }

  @override
  deleteAll() {
    dataSource.deleteAll();
  }

  @override
  deleteone(int index) {
    dataSource.deleteone(index);
  }

  @override
  Future<List<NoteEntity>> noteList() {
    return dataSource.noteList();
  }

  @override
  edit({required int index, required NoteEntity value}) {
    return dataSource.edit(index: index, value: value);
  }
}
