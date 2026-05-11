import 'package:flutter/material.dart';

class NoteAppProvider with ChangeNotifier {
  String? _title;
  String? _des;

  void addNotes(String title, String des) {
    this._title = title;
    this._des = des;
  }

  String get title => this._title!;
  String get des => this.des!;
}
