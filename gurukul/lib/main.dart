import 'package:flutter/material.dart';
import 'screens/courses_screen.dart';

void main() {
  runApp(GurukulApp());
}

class GurukulApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gurukul',
      theme: ThemeData(
        primaryColor: Color(0xFF233A7D),
        fontFamily:
            'Montserrat', // You can change or remove this if not using Montserrat
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF233A7D),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: CoursesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
