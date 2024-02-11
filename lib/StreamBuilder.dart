import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          'Stream Builder',
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              color: Colors.black,
              width: double.infinity,
              child: Text(
                ' Total Register Users',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.white),
              )),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("users").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // Assuming your data structure has a 'name' field in each document
                  // Replace 'name' with the actual field you want to display
                  List<DocumentSnapshot> documents = snapshot.data!.docs;
                  List<String> names = documents
                      .map((doc) => doc['username'].toString())
                      .toList();
                  List<String> pass = documents
                      .map((doc) => doc['password'].toString())
                      .toList();
                  List<String> img = documents
                      .map((doc) => doc['user-image'].toString())
                      .toList();
                  documents.forEach((doc) {
                    print('Document Data: ${doc.data()}');
                  });

                  return ListView.builder(
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(names[index],style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                        subtitle: Text(pass[index],style: TextStyle(fontSize: 20)),
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(img[index]),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
