import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/FirebaseList.dart';
import 'package:new_app/constants_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        backgroundColor: ConstantColors.darkBlue,
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
  var nameController = TextEditingController();
  var rnoController = TextEditingController();
  var ageController = TextEditingController();
  var fatherController = TextEditingController();
  var motherController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
              padding: EdgeInsets.only(top : screenHeight * 0.05),
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
          padding: EdgeInsets.only(left: screenWidth * 0.04, top: screenHeight * 0.04),
          child: Row(
            children:[
              const Text("Name : ",
              textScaleFactor: 1.3,),
              Padding(
                padding: EdgeInsets.only(left : screenWidth * 0.02),
                child: SizedBox(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.72,
                  child: Padding(
                    padding: EdgeInsets.only(left : screenWidth * 0.03),
                    child: TextField(
                      controller : nameController,
                        style: const TextStyle(
                          letterSpacing: 1.0
                        ),
                        decoration: const InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: "Enter your name",
                        ),
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
                    width: screenWidth * 0.73,
                    child: Padding(
                      padding: EdgeInsets.only(left : screenWidth * 0.04),
                      child: TextField(
                        controller: rnoController,
                        style: const TextStyle(letterSpacing: 1.0),
                        decoration: const InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: "Enter your roll number",
                        ),
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
                  "Age : ",
                  textScaleFactor: 1.3,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.03),
                  child: SizedBox(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.74,
                    child: Padding(
                      padding: EdgeInsets.only(left : screenWidth * 0.05),
                      child:  TextField(
                        controller: ageController,
                        style: const TextStyle(letterSpacing: 1.0),
                        decoration: const InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: "Enter your age",
                        ),
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
                  "Father's\nName: ",
                  textScaleFactor: 1.3,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.03),
                  child: SizedBox(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.7,
                    child: Padding(
                      padding:  EdgeInsets.only(left : screenWidth * 0.01),
                      child:  TextField(
                        controller: fatherController,
                        style: const TextStyle(letterSpacing: 1.0),
                        decoration: const InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: "Enter your father's name",
                        ),
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
                  "Mother's\nName: ",
                  textScaleFactor: 1.3,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.0),
                  child: SizedBox(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.71,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.02),
                      child: TextField(
                        controller: motherController,
                        style:const  TextStyle(letterSpacing: 1.0),
                        decoration: const InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: "Enter your mother's name",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left : screenWidth * 0.05 , top : screenHeight * 0.08),
            child: SizedBox(
    
              height: 45.0,
              width: 350.0,
              child: ElevatedButton(onPressed: () {
                  Map<String , String> map = Map();
                  map["name"] = nameController.text;
                  map["rno"] = rnoController.text;
                  map["age"] = ageController.text;
                  map["father"] = fatherController.text;
                  map["mother"] = motherController.text;
                  print(map);
              },            
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(ConstantColors.darkBlue),
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(
                      fontSize: 18.0,
                      color: Colors.white60
                      )
                  ),
                  overlayColor: MaterialStatePropertyAll(Colors.blue),
                  shadowColor: MaterialStatePropertyAll(Colors.black),
                  elevation: MaterialStatePropertyAll(12)
              ), child: const Text("SUBMIT"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, top: screenHeight * 0.03),
            child: SizedBox(
              height: 45.0,
              width: 350.0,
              child: ElevatedButton(
                onPressed: () {
                  print("Checklist clicked");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FireBaseList()),
                  );

                },
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ConstantColors.darkBlue),
                    textStyle: MaterialStatePropertyAll(
                        TextStyle(fontSize: 18.0, color: Colors.white60)),
                    overlayColor: MaterialStatePropertyAll(Colors.blue),
                    shadowColor: MaterialStatePropertyAll(Colors.black),
                    elevation: MaterialStatePropertyAll(12)),
                child: const Text("CHECK LIST"),
                
              ),
            ),
          )
        ],
      ),
    );
  }
}