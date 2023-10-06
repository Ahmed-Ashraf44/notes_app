
class AddNotesStates {}

class AddNotesinitialState extends AddNotesStates{}

class AddNotesLoadingState extends AddNotesStates {}

class AddNotesSuccesState extends AddNotesStates{}

class AddNotesFaulireState extends AddNotesStates{
  final String errorMasseges;
  AddNotesFaulireState({required this.errorMasseges});
}