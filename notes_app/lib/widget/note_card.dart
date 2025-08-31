import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widget/notes_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.index, required this.onNoteDeleted});
  final Note note;
  final int index;
  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NotesView(note: note, index: index, onNoteDeleted: onNoteDeleted,),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.title, style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              Text(
                note.body,
                style: TextStyle(fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
