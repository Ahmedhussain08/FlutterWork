import 'package:flutter/material.dart';

class listtile extends StatefulWidget {
  const listtile({super.key});

  @override
  State<listtile> createState() => _listtileState();
}

class _listtileState extends State<listtile> {
  var arrNames = ['Ahmed','Faizan','Shayan','Rohit','Fahad','Anas'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      title: Text('ListTile With Listview Builder ',style: TextStyle(fontWeight: FontWeight.w800,letterSpacing: 2),),
      centerTitle: true,
    ),
      body: ListView.separated(itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage:AssetImage("images/avatar.png"),

          ),
         title: Text(arrNames[index],style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,letterSpacing: 2),),
         subtitle: Text('+923000000123',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
         trailing: Icon(Icons.add_circle_sharp,color: Colors.blue,size: 40,),
        );
      },
        separatorBuilder: (context, index) {
          return Divider(height: 25,);
        },
      itemCount: arrNames.length,),
    );
  }
}
