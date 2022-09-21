import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_app/constants_color.dart';

class FireBaseList extends StatefulWidget {
  const FireBaseList({super.key});

  @override
  State<FireBaseList> createState() => _FireBaseListState();
}

class _FireBaseListState extends State<FireBaseList> {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListOfItems(),
    );
  }
}

class ListOfItems extends StatefulWidget {
  const ListOfItems({super.key});

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase List"),
        backgroundColor: ConstantColors.darkBlue,
      ),
    );
  }
}