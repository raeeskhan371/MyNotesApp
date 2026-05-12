import 'package:auth_navtech/Provider/NotesApp_Provider.dart';
import 'package:auth_navtech/Screens/addNotes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: Column(
            children: [
              Container(
                child: Text(
                  " MyNotes ",
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Stream Builder
              StreamBuilder(
                stream: context.read<NoteAppProvider>().getData(),
                builder: (context, snapshot) {
                  var docs = snapshot.data!.docs;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        var mydocs = docs[index];
                        return ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.green),
                          title: Text(mydocs["title"]),
                          subtitle: Text(mydocs["description"]),
                          trailing: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.delete, color: Colors.red),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Addnotes()),
                  );
                },

                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.indigo,
                  ),
                  child: Center(
                    child: Text(
                      "Add Notes ",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
