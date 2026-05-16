import 'package:auth_navtech/ui/Ad_note_BottomeSheet.dart';
import 'package:flutter/material.dart';

class AddNotes_Button extends StatefulWidget {
  const AddNotes_Button({super.key});

  @override
  State<AddNotes_Button> createState() => _AddNotes_ButtonState();
}

class _AddNotes_ButtonState extends State<AddNotes_Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return AddNoteButtonBottomSheet();
          },
        );
      },
      child: Container(
        height: 55,
        width: 70,

        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
