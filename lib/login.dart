
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form/signup.dart';
import 'dashboard.dart';
import 'package:achievement_view/achievement_view.dart';


class login extends StatefulWidget {
  const login({super.key});
  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {
  final username = TextEditingController();
  final password = TextEditingController();

  void showAchievementView(BuildContext, context){
    AchievementView(
      title: "Congrats!",
      subTitle: "You are LoggedIn successfully",
      color: Colors.green
    ).show(context);
  }

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
              SizedBox(
                height: 30,
              ),
              CustomFormField(
                  label1: 'Enter Username',
                  hintText1: 'Enter Username',
                  Icon1: Icons.verified_user,
                  controller1: username),
              SizedBox(
                height: 30,
              ),
              CustomFormField(
                  label1: 'Enter Password',
                  hintText1: 'Enter Password',
                  Icon1: Icons.password,
                  controller1: password),
              SizedBox(
                height: 30,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                    onPressed: ()  {
                      String uname = username.text;
                      String pass = password.text;
                      username.clear();
                      password.clear();
                      if(uname.isNotEmpty && pass.isNotEmpty){
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: uname, password: pass);
                        showAchievementView(BuildContext, context);
                      }
                      else{
                        void showErrorDialog(BuildContext context) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error!',style: TextStyle(color: Colors.red.shade900),),
                                content: Text('Invalid Username or Password'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(Colors.grey),
                                    ),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(Colors.blue),
                                    ),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        showErrorDialog(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 20),
                        padding: EdgeInsets.all(17),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text('Login'), ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
