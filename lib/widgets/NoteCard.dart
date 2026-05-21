import 'package:auth_navtech/Provider/NotesApp_Provider.dart';
import 'package:auth_navtech/widgets/AddNoteBottomSheet.dart';
import 'package:auth_navtech/widgets/UpdateNoteBottomeSheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatefulWidget {
  NoteCard({super.key, required this.doc});

  final QueryDocumentSnapshot<Object?> doc;

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      color: Colors.white,
      child: ListTile(
        title: Text(
          widget.doc["title"],

          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          widget.doc["description"],
          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
        ),

        leading: const CircleAvatar(
          child: Icon(Icons.note_alt, color: Colors.blue),
          backgroundColor: Colors.white,
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                context.read<NotesProvider>().titleController.text =
                    widget.doc["title"];
                context.read<NotesProvider>().desController.text =
                    widget.doc["description"];

                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return UpdateNoteBottomSheet(id: widget.doc.id);
                  },
                );
              },
              child: Icon(Icons.edit, color: Colors.blue),
            ),

            SizedBox(width: 10),

            GestureDetector(
              onTap: () async {
                await context.read<NotesProvider>().deletNote(widget.doc.id);
              },
              child: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
