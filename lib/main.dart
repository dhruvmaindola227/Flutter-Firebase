import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewPage(),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Attempt"),
        shadowColor: Colors.black45,
        backgroundColor: Colors.blue.shade200,
      ),
      body: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Padding(
            padding: EdgeInsets.only(top : screenHeight * 0.08),
            child: SizedBox(
              width: double.infinity,
              child: Text("Insert details",
              style: GoogleFonts.poppins(
                fontSize: 20.0
              ),
              textAlign: TextAlign.center,
              ),
            ),
          ),
       Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.04, top: screenHeight * 0.1),
        child: Row(
          children:[
            const Text("Name : ",
            textScaleFactor: 1.3,),
            Padding(
              padding: EdgeInsets.only(left : screenWidth * 0.02),
              child: SizedBox(
                height: screenHeight * 0.06,
                width: screenWidth * 0.7,
                child: const TextField(
                    style: TextStyle(
                      letterSpacing: 1.0
                    ),
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Enter your name",
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
      Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.05, top: screenHeight * 0.05),
          child: Row(
            children: [
              const Text(
                "R_no : ",
                textScaleFactor: 1.3,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.02),
                child: SizedBox(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.7,
                  child: const TextField(
                    style: TextStyle(letterSpacing: 1.0),
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Enter your roll number",
                    ),
                  ),
                ),
              ),
            ],
          ),
        )    
      ],
    );
  }
}