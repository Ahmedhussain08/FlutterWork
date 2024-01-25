import 'package:flutter/material.dart';

class loader3 extends StatefulWidget {
  const loader3({super.key});

  @override
  State<loader3> createState() => _loader3State();
}

class _loader3State extends State<loader3> {
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
                    child: Center(child: Text('2/3',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                  ),
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: Center(child: Text('Skip',style: TextStyle(color: Colors.blue),)),
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
                        image: AssetImage("images/img2.jpg"),
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
