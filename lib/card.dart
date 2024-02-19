import 'package:flutter/material.dart';

class card extends StatefulWidget {
  const card({super.key});

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 2,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  child: Image.network('https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                  fit: BoxFit.fitWidth,
                  ),

                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: Colors.purple,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
