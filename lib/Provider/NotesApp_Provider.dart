import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  final notesCollection = FirebaseFirestore.instance.collection("Notes");

  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  // AddNotes Function
  Future<void> addNote() async {
    await notesCollection.add({
      "title": titleController.text.toString(),
      "description": desController.text.toString(),
    });
    titleController.clear();
    desController.clear();

    notifyListeners();
  }

  // getNotes Function
  Stream<QuerySnapshot> getNotes() {
    return notesCollection.snapshots();
  }

  // DeleteNote Function
  Future<void> deletNote(String id) async {
    await notesCollection.doc(id).delete();
  }

  // UpdateNote
  Future<void> updateNote(String id) async {
    await notesCollection.doc(id).update({
      "title": titleController.text,
      "description": desController.text,
    });
  }
}
