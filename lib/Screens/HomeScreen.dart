import 'package:auth_navtech/Provider/NotesApp_Provider.dart';
import 'package:auth_navtech/Screens/addNotes.dart';
import 'package:auth_navtech/Screens/edit_screen.dart';
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
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Notes")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    var docs = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(docs[index]["title"]),
                          subtitle: Text(docs[index]["description"]),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await FirebaseFirestore.instance
                                      .collection("Notes")
                                      .doc(docs[index].id)
                                      .delete();
                                },
                                child: Icon(Icons.delete),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditScreen(
                                        title: docs[index]["title"].toString(),
                                        description: docs[index]["description"]
                                            .toString(),
                                        id: docs[index].id.toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
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
