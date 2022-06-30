import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/constants.dart';



class InputDecorations {
 
  static InputDecoration authInputDecoration({
    
    required String hintText,
    required String labelText,
    
    IconData? prefixIcon,
    IconButton? sufixIcon,
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 224, 219, 219)
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: secondColor,
            width: 2
          )
        ),
        hintText: hintText,
      
        hintStyle: const TextStyle(color: Colors.grey),
        labelText: labelText,
        labelStyle: GoogleFonts.kalam(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        prefixIcon: prefixIcon != null 
          ? Icon( prefixIcon, color: primaryColor )
          : null,
        suffixIcon:  sufixIcon != null 
          ? sufixIcon : null
      );
  }  

}