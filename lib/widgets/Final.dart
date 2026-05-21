import 'package:flutter/material.dart';

class NoteCardss extends StatefulWidget {
  const NoteCardss({super.key});

  @override
  State<NoteCardss> createState() => _NoteCardssState();
}

class _NoteCardssState extends State<NoteCardss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
