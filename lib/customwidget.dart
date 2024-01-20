import 'dart:io';

import 'package:flutter/material.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async{
                    XFile? selectedImage  = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if(selectedImage!=null){
                      File image1 = File(selectedImage.path);
                      setState(() {
                        p_image = image1;
                      });

                    }
                  },
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(controller1: p_name,label1: 'Enter Name',hintText1: 'Enetr Product Name',Icon1: Icons.abc_outlined,),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(controller1: p_name,label1: 'Enter Price',hintText1: 'Enetr Product Price',Icon1: Icons.ac_unit_sharp,),
                SizedBox(
                  height: 20,
                ),
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

 CustomFormField({required this.label1,required this.hintText1,required this.Icon1,required this.controller1});

 @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      decoration: InputDecoration(
        label: Text('$label1'),
        hintText: '$hintText1',
        prefixIcon: Icon(Icon1),
        border: OutlineInputBorder()
      ),
    );
  }
}

