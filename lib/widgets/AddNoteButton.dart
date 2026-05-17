import 'package:auth_navtech/widgets/AddNoteBottomSheet.dart';
import 'package:flutter/material.dart';

class AddNoteButton extends StatelessWidget {
  AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return AddNoteBottomSheet();
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
