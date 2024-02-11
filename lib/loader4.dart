import 'package:flutter/material.dart';
import 'package:form/home.dart';
import 'signup.dart';

class loader4 extends StatefulWidget {
  const loader4({super.key});

  @override
  State<loader4> createState() => _loader4State();
}

class _loader4State extends State<loader4> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all( )
                    ),
                    child: Center(child: Text('3/3',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
                    },
                    child: Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                      child: Center(child: Text('Skip',style: TextStyle(color: Colors.blue),)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: Center(
                  child: Container(
                    height:double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/img3.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
