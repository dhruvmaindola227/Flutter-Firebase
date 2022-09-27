import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_app/constants_color.dart';
import 'package:new_app/main.dart';

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
    return const ListOfItems();
  }
}

class ListOfItems extends StatefulWidget {
  const ListOfItems({super.key});

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');
  late AsyncSnapshot<QuerySnapshot> streamSnapshot;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase List"),
        backgroundColor: ConstantColors.darkBlue,
      ),
      body: StreamBuilder(builder: (context, snapshot) { //snapshot has the data and the docs(rows) in it.
        if(snapshot.hasData){
          return ListView.builder(
                itemCount: snapshot.data!.docs.length,  //number of rows in firebase
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = 
                  snapshot.data!.docs[index];
            return Card(
              margin: const EdgeInsets.all(10),
              elevation: 10,
              child: ColoredBox(              
                color: ConstantColors.darkBlue,
                child: SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.9,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left : 10.0 , top : 20.0),
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ${documentSnapshot['name'].toString()}"),
                            Padding(
                              padding: const EdgeInsets.only(top : 8.0),
                              child: Text("Roll Number : ${documentSnapshot['rno'].toString()}"),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left : 120.0 , top : 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Age : ${documentSnapshot['age'].toString()}"),
                            Text("Mother name : ${documentSnapshot['mothername'].toString()}"),
                            Text( "Father name : ${documentSnapshot['fathername'].toString()}")
                          ],
                        ),
                      )
                    ],
                  )
              
                ),
              )
              //  ListTile(
              //   title: Text(documentSnapshot['age'].toString()),
              //   subtitle: Text(documentSnapshot['name'].toString())
              // ),
            );
          },
          );
        }else {
          return const Text("no data");
        }
      },
      stream: _users.snapshots(
        includeMetadataChanges: false
        ),
        )

    );
  }
}
