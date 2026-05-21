import 'package:auth_navtech/Screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return "Please enter email adress";
                  }
                  if (!email.contains("@")) {
                    return "Invalid email";
                  }
                  if (!email.contains(".com")) {
                    return "Please enter .com";
                  }
                  if (email.length < 5) {
                    return "Email is to short";
                  }
                },
                controller: emailController,
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
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return "Please enter password";
                  }
                  if (password.length < 8) {
                    return "Please enter minimum  8 chracter";
                  }
                },
                controller: passwordController,
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
                validator: (ConfirmPass) {
                  if (ConfirmPass == null || ConfirmPass.isEmpty) {
                    return "Confirm password is incorrect";
                  }
                  if (ConfirmPass != passwordController.text) {
                    return "Confirm password is incorrect check your in correct passwrod";
                  }
                },
                controller: confirmPasswordController,
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
                      email: emailController.text.toString(),
                      password: passwordController.text.toString(),
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
