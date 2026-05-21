import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  final notesCollection = FirebaseFirestore.instance.collection("Notes");

  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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

  // Email Validation
  String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return "Please enter email adress";
    }
    if (!email.contains("@")) {
      return "Invalid email";
    }
    if (!email.contains(".com")) {
      return "Please enter .com";
    }
    if (email.length < 5) {
      return "Email is to short";
    } else {
      return null;
    }
  }

  // Password Validation
  String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please enter password";
    }
    if (password.length < 8) {
      return "Please enter minimum  8 chracter";
    } else {
      return null;
    }
  }

  String? confirmValidation(String? ConfirmPass) {
    if (ConfirmPass == null || ConfirmPass.isEmpty) {
      return "Confirm password is incorrect";
    }
    if (ConfirmPass != passwordController.text.toString()) {
      return "Confirm password is incorrect check your in correct passwrod";
    } else
      return null;
  }
}
