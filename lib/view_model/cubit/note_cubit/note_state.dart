
abstract class NoteState {}

class NoteInitial extends NoteState {}
class NoteCreateDataBaseState extends NoteState {}

class NoteInsertDataBaseState extends NoteState {}

class NoteUpdateDataBaseState extends NoteState {}

class NoteDeleteDataBaseState extends NoteState {}

class NoteGetDataBaseState extends NoteState {}

class NoteGetDataBaseLoadingState extends NoteState {}
