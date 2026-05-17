// import 'package:auth_navtech/Screens/HomeScreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuthLogin = FirebaseAuth.instance;

//   void AuthExceptionHandling() async {
//     try {
//       await FirebaseAuthLogin.signInWithEmailAndPassword(
//         email: emailController.text.trim().toString(),
//         password: passwordController.text.trim().toString(),
//       );
//       SnackBar(content: Text("Login Successfully"));
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Homescreen()),
//       );
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Welcome Back! To MyNotesApp",
//               style: GoogleFonts.poppins(
//                 color: Colors.indigoAccent,
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               "Login Your Account and Countinue Your Daily Notes",
//               style: GoogleFonts.poppins(
//                 color: Colors.blueAccent,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 label: Text("Email"),
//                 enabledBorder: OutlineInputBorder(),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 label: Text("Password"),
//                 enabledBorder: OutlineInputBorder(),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             InkWell(
//               onTap: () {
//                 AuthExceptionHandling();
//               },
//               child: Container(
//                 height: 50,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: Colors.indigo,
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Login",
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
