import 'dart:math';

import 'package:auth_navtech/Screens/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteAppProvider extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  // AddNote Function
  Future<void> addNotes(BuildContext context) async {
    try {
      await firestore.collection("Notes").add({
        "title": titleController.text.toString(),
        "description": desController.text.toString(),
      });
      titleController.clear();
      desController.clear();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Notes Add Sucessfully!")));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }

    notifyListeners();
  }

  Stream<QuerySnapshot>? getData() {
    return firestore.collection("Notes").snapshots();
  }
}
