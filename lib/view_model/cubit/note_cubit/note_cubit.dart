import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/view_model/cubit/note_cubit/note_state.dart';
import 'package:sqflite/sqflite.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context) => BlocProvider.of(context);
  List<Map> notes = [];
  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteDateController = TextEditingController();
  TextEditingController noteBodyController = TextEditingController();
  late Database database;

  void createDatabase() async {
    openDatabase(
      'note.db',
      version: 1,
      onCreate: (database, v) {
        print('database created');
        database.execute('''CREATE TABLE Tasks
             (id INTEGER PRIMARY KEY, title TEXT,date TEXT,body TEXT)''').then((value) => print('table created'));
      },
      onOpen: (database) {
        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(NoteCreateDataBaseState());
    });
  }

  void insertToDatabase({
    required String title,
    required String time,
    required String body,
  }) async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
        'INSERT INTO tasks(title, date, body) VALUES("$title", "$time", "$body")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(NoteInsertDataBaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(Database database) {
    notes = [];

    emit(NoteGetDataBaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      for (Map<String, Object?> element in value) {
        notes.add(element);
      }

      emit(NoteGetDataBaseState());
    });
  }

  addToDatabaseButton(context) {
    print('Loading');

    insertToDatabase(
      title: noteTitleController.text,
      time: noteDateController.text,
      body: noteBodyController.text,
    );
    print('done');
    emit(NoteInsertDataBaseState());
  }
}
