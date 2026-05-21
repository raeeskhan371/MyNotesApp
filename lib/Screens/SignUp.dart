import 'package:auth_navtech/Provider/NotesApp_Provider.dart';
import 'package:auth_navtech/Screens/Login.dart';
import 'package:auth_navtech/appFunctions/function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuthSignUp = FirebaseAuth.instance;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  String specialChracterpass = r'[!@#$%^&*(),.?":{}|<>]';
  late RegExp specialChracter = RegExp(specialChracterpass);
  late RegExp emailChecker = RegExp(emailPattern);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome To MyNotesApp",
                style: GoogleFonts.poppins(
                  color: Colors.indigoAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Create Your Account and Save Your Daily Notes",
                style: GoogleFonts.poppins(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: context.read<NotesProvider>().emailValidation,
                controller: context.read<NotesProvider>().emailController,
                decoration: InputDecoration(
                  label: Text("Email"),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: context.read<NotesProvider>().passwordValidation,
                controller: context.read<NotesProvider>().passwordController,
                decoration: InputDecoration(
                  label: Text("Password"),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: context.read<NotesProvider>().confirmValidation,
                controller: context
                    .read<NotesProvider>()
                    .confirmPasswordController,
                decoration: InputDecoration(
                  label: Text("Confirm Password"),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // SignuP Button
              InkWell(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    FirebaseAuthSignUp.createUserWithEmailAndPassword(
                      email: context
                          .read<NotesProvider>()
                          .emailController
                          .text
                          .toString(),
                      password: context
                          .read<NotesProvider>()
                          .passwordController
                          .text
                          .toString(),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  } else
                    return null;
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
                      "SignUp",
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
