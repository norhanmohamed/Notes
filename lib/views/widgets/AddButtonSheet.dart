import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/add-note_form_sheet.dart';

class AddButtonModelSheet extends StatelessWidget {
  const AddButtonModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
          if (state is AddNoteFailure) {}
        },
        builder: (context, state) {
          return Builder(builder: (context) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const SingleChildScrollView(
                  child: AddNoteForm(),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
