// import 'package:auth_navtech/Provider/NotesApp_Provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class EditScreen extends StatefulWidget {
//   final String title;
//   final String description;
//   final String id;

//   EditScreen({
//     required this.title,
//     required this.description,
//     required this.id,
//   });

//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("TextField Example")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               controller: context.read<NoteAppProvider>().titleController,
//               decoration: InputDecoration(border: OutlineInputBorder()),
//             ),

//             const SizedBox(height: 20),

//             TextField(
//               controller: context.read<NoteAppProvider>().desController,
//               decoration: InputDecoration(border: OutlineInputBorder()),
//             ),

//             ElevatedButton(
//               onPressed: () async {
//                 await FirebaseFirestore.instance
//                     .collection("Notes")
//                     .doc(widget.id)
//                     .update({
//                       "title": context
//                           .read<NoteAppProvider>()
//                           .titleController
//                           .text
//                           .toString(),
//                       "description": context
//                           .read<NoteAppProvider>()
//                           .desController
//                           .text
//                           .toString(),
//                     });
//                 Navigator.pop(context);
//               },
//               child: const Text("Update"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
