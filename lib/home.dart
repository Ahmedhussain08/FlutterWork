import 'package:flutter/material.dart';
import 'package:form/StreamBuilder.dart';
import 'package:form/dashboard.dart';
import 'package:form/listtile.dart';
import 'package:form/listviewbuilder.dart';
import 'package:form/signup.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text(
            'Home Page',
            style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 3),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.all(0),  children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  currentAccountPictureSize: Size.square(50),
                  decoration: BoxDecoration(color: Colors.blue),
                  accountEmail: Text('User@email.com'),
                  accountName: Text('Username'),
                  currentAccountPicture: CircleAvatar(
                    child: Text(
                      'A',
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ),
                    backgroundColor: Colors.white,
                  ),
                )),
            ListTile(
              leading: Icon(Icons.add_task),
              title: Text('Add new User'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('See Current Users'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FetchData()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('ListTile Page'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>listtile()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('ListviewBuilder Page'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>listview()));
              },
            ),
            Divider(), ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard Page'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
              },
            ),
            Divider(),
          ]),
        ),
        body: Column());
  }
}
