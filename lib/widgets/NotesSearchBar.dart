import 'package:auth_navtech/widgets/AddNoteButton.dart';
import 'package:flutter/material.dart';

class NotesSearchBar extends StatelessWidget {
  const NotesSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                hintText: "Search your Notes...",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          // add Task Container
          AddNoteButton(),
        ],
      ),
    );
  }
}
