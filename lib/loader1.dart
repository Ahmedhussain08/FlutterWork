import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'loader3.dart';
import 'loader4.dart';
import 'loader2.dart';

class loader1 extends StatefulWidget {
  const loader1({super.key});

  @override
  State<loader1> createState() => _loader1State();
}

class _loader1State extends State<loader1> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                loader2(pageController: _controller,),
                loader3(pageController: _controller),
                loader4(),
              ],
            ),
          ),
          SmoothPageIndicator(controller: _controller, count: 3,
          effect: ScrollingDotsEffect(
            activeDotColor: Colors.blue,
            dotColor: Colors.blueGrey
          ),
          )
        ],
      ),
    );
    
    

  }
}
