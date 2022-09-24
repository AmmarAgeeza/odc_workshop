import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/shared/components.dart';
import 'package:odc_bootcamp/view/screens/notes_screen/add_note_screen.dart';
import 'package:odc_bootcamp/view_model/cubit/note_cubit/note_state.dart';

import '../../../view_model/cubit/note_cubit/note_cubit.dart';
import '../../components/note_components/note_components.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            title: const Text(
              'Notes',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            centerTitle: true,
          ),
          body: tasksBuilder(tasks: NoteCubit.get(context).notes),
          floatingActionButton: FloatingActionButton(
            backgroundColor:  Colors.blueGrey,
            onPressed: () {
              navigateTo(context, const AddNoteScreen());
            },
            child: const Icon(Icons.add,color: Colors.black),
          ),
        );
      },
    );
  }
}
