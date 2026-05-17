import 'package:auth_navtech/Provider/NotesApp_Provider.dart';
import 'package:auth_navtech/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Add Note",
              style: GoogleFonts.poppins(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: context.read<NotesProvider>().titleController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: context.read<NotesProvider>().desController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onPressed: () async {
                    await context.read<NotesProvider>().addNote();
                    Navigator.pop(context);
                  },
                  buttonText: "Add Note",
                  textColor: Colors.white,
                  buttonColor: Colors.blue,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonText: "Cancel",
                  textColor: Colors.white,
                  buttonColor: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
