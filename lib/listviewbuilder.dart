import 'package:flutter/material.dart';

class listview extends StatefulWidget {
  const listview({super.key});

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Listview Builder',style: TextStyle(fontWeight: FontWeight.w800,letterSpacing: 3),),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Container(
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'ListItem $index',
                    style: TextStyle(fontSize: 23,color: Colors.white),
                  ),
                ),
              ));
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 8,
      ),
    );
  }
}
