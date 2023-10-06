part of 'search_note_cubit.dart';

@immutable
sealed class SearchNoteState {}

final class SearchNoteInitial extends SearchNoteState {}
final class SearchNoteSuccess extends SearchNoteState {}
// final class SearchNoteFailure extends SearchNoteState 
// {

// }
