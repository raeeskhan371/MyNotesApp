import 'package:auth_navtech/ui/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowAllNotes extends StatefulWidget {
  const ShowAllNotes({super.key});

  @override
  State<ShowAllNotes> createState() => _ShowAllNotesState();
}

class _ShowAllNotesState extends State<ShowAllNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top My Notes Row
                Row(
                  children: [
                    Text(
                      "My Notes",
                      style: GoogleFonts.poppins(
                        fontSize: 34,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),

                    Icon(Icons.search),
                    const SizedBox(width: 10),
                    Icon(Icons.menu),
                  ],
                ),
                Text(
                  "All your thoughts in one place.",
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                ),

                // Search Bar Content
                SearchBarr(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
