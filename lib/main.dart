import 'package:auth_navtech/Provider/NotesApp_Provider.dart';
import 'package:auth_navtech/Screens/Login.dart';
import 'package:auth_navtech/Screens/ShowNotes.dart';
import 'package:auth_navtech/Screens/SignUp.dart';
import 'package:auth_navtech/Screens/addNotes.dart';
import 'package:auth_navtech/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteAppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: ShowAllNotes(),
    );
  }
}
