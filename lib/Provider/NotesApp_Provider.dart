import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  final notesCollection = FirebaseFirestore.instance.collection("Notes");

  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  // AddNotes Function
  Future<void> addNotes() async {
    await notesCollection.add({
      "title": titleController.text.toString(),
      "description": desController.text.toString(),
    });
    notifyListeners();
  }
}
