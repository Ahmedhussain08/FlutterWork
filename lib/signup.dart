import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form/login.dart';
import 'package:image_picker/image_picker.dart';

class customwidget extends StatefulWidget {
  const customwidget({super.key});
  @override
  State<customwidget> createState() => _customwidgetState();
}

class _customwidgetState extends State<customwidget> {
  final p_name = TextEditingController();
  final p_price = TextEditingController();
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
                  radius: 100,
                  backgroundImage: p_image != null ? FileImage(p_image!) : null,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                controller1: p_name,
                label1: 'Enter Name',
                hintText1: 'Enetr Product Name',
                Icon1: Icons.abc_outlined,
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                controller1: p_price,
                label1: 'Enter Price',
                hintText1: 'Enetr Product Price',
                Icon1: Icons.ac_unit_sharp,
              ),
              SizedBox(
                height: 20,
              ),
              OverflowBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: ElevatedButton(
                          onPressed: () {
                            String proname = p_name.text;
                            String proprice = p_price.text;
                            Map<String, String> productdata = {
                              "pname": proname,
                              "pprice": proprice
                            };
                            FirebaseFirestore.instance
                                .collection('products')
                                .add(productdata);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text('Signup')),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue,
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text('Login')),
                    ),
                  ])
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
          labelStyle: TextStyle(
            color: Colors.blueGrey
          ),
          hintText: '$hintText1',
          prefixIcon: Icon(Icon1,color: Colors.blue,),

          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue,width: 1)
          ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue,width: 1)
        ),

      ),
    );
  }
}
