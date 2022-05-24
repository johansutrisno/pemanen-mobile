import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pemanen_mobile/pages/detail_pemanen/detail_pemanen_screen.dart';
import 'package:pemanen_mobile/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
        backgroundColor: Colors.white,
        dividerColor: black200,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: primary,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: false,
          titleTextStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      home: const DetailPemanenScreen(),
    );
  }
}
