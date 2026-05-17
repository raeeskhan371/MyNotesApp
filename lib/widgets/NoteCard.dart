import 'package:auth_navtech/Provider/NotesApp_Provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(
          widget.doc["title"],

          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(widget.doc["description"]),

        leading: const CircleAvatar(child: Icon(Icons.note)),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.edit, color: Colors.blue),

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
