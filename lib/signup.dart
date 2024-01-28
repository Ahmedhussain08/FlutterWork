import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form/login.dart';
import 'package:image_picker/image_picker.dart';

class signup extends StatefulWidget {
  const signup({super.key});
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final username = TextEditingController();
  final password = TextEditingController();
  File? p_image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  XFile? selectedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (selectedImage != null) {
                    File image1 = File(selectedImage.path);
                    setState(() {
                      p_image = image1;
                    });
                  }
                },
                child: CircleAvatar(
                  minRadius: 60,
                  maxRadius: 80,
                  backgroundImage: p_image != null ? FileImage(p_image!) : null,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                controller1: username,
                label1: 'UserName',
                hintText1: 'Enetr UserName',
                Icon1: Icons.abc_outlined,
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                controller1: password,
                label1: 'Enter password',
                hintText1: 'Enetr password',
                Icon1: Icons.ac_unit_sharp,
              ),
              SizedBox(
                height: 30,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                    onPressed: () {
                      String uname = username.text;
                      String pass = password.text;
                      Map<String, String> userdata = {
                        "username": uname,
                        "password": pass
                      };
                      FirebaseFirestore.instance
                          .collection('users')
                          .add(userdata);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 20),
                        padding: EdgeInsets.all(17),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text('Signup')),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: Text(
                'OR',
                style: TextStyle(fontSize: 15, color: Colors.blue),
              )),
              SizedBox(
                height: 5,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        foregroundColor: Colors.blue,
                        textStyle: TextStyle(fontSize: 20),
                        padding: EdgeInsets.all(17),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text('Login')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  String? label1;
  String? hintText1;
  IconData? Icon1;
  TextEditingController? controller1;

  CustomFormField(
      {required this.label1,
      required this.hintText1,
      required this.Icon1,
      required this.controller1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller1,
      decoration: InputDecoration(
        label: Text('$label1'),
        labelStyle: TextStyle(color: Colors.blueGrey),
        hintText: '$hintText1',
        prefixIcon: Icon(
          Icon1,
          color: Colors.blue,
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1)),
      ),
    );
  }
}
