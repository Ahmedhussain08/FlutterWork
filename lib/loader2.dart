import 'package:flutter/material.dart';
import 'loader3.dart';

class loader2 extends StatelessWidget {
  final PageController pageController;

  loader2({required this.pageController});

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
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Text(
                      '1/3',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Slide to the next page (loader3)
                    pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 30,
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
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
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/img1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
