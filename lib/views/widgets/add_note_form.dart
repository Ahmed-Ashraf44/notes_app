import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Notes/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:Notes/cubits/add_note_cubit/add_notes_states.dart';
import 'package:Notes/models/notes_model.dart';
import 'package:Notes/views/widgets/color_list.dart';
import 'package:Notes/views/widgets/custom_button.dart';
import 'package:Notes/views/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hint: 'Content',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorList(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNotesCubit, AddNotesStates>(
            builder: (context, state) => CustomButton(
              isLoading: state is AddNotesLoadingState ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var currentDate = DateTime.now();
                  var formetCurrentDate =
                      DateFormat('dd-MM-yyyy').format(currentDate);
                  var notes = NotesModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formetCurrentDate,
                      color: Colors.blue.value);
                  BlocProvider.of<AddNotesCubit>(context).getNotes(notes);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
