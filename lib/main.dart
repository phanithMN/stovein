import 'package:flutter/material.dart';
import 'package:storevein/screens/nav_bar_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.mulishTextTheme(),
    ),
    home: const NavBarBottom(),
  );
}

