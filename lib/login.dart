import 'package:flutter/material.dart';
import 'package:form/signup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              CustomFormField(
                  label1: 'Enter Username',
                  hintText1: 'Enter Username',
                  Icon1: Icons.verified_user,
                  controller1: username),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                  label1: 'Enter Password',
                  hintText1: 'Enter Password',
                  Icon1: Icons.password,
                  controller1: username),
              SizedBox(
                height: 20,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(15),
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
