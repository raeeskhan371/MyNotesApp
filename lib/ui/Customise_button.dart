import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customise_button extends StatefulWidget {
  VoidCallback onPressed;
  String buttonText;
  Color textColor;
  Color buttonColor;
  Customise_button({
    super.key,
    required this.buttonText,
    required this.textColor,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  State<Customise_button> createState() => _Customise_buttonState();
}

class _Customise_buttonState extends State<Customise_button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.buttonText,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: widget.textColor,
        ),
      ),
    );
  }
}
