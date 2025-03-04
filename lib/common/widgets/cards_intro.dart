import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_fonts.dart';

class AnimatedIntroScreen extends StatefulWidget {
  const AnimatedIntroScreen({super.key});

  @override
  _AnimatedIntroScreenState createState() => _AnimatedIntroScreenState();
}

class _AnimatedIntroScreenState extends State<AnimatedIntroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _leftCardAnimation;
  late Animation<Offset> _rightCardAnimation;
  late Animation<double> _leftRotationAnimation;
  late Animation<double> _rightRotationAnimation;
  late Animation<Offset> _centerCardAnimation;
  late Animation<double> _centerRotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _leftCardAnimation = Tween<Offset>(
      begin: Offset(-2, 0), // Start from the left offscreen
      end: Offset(-0.3, 0), // Move to the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _rightCardAnimation = Tween<Offset>(
      begin: Offset(2, 0), // Start from the right offscreen
      end: Offset(0.3, 0.25), // Move to the center
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _leftRotationAnimation = Tween<double>(
      begin: -0.2, // Initial rotation in radians (slightly tilted left)
      end: -0.3, // Final rotation
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _rightRotationAnimation = Tween<double>(
      begin: 0.2, // Initial rotation in radians (slightly tilted right)
      end: 0.3, // Final rotation
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _centerCardAnimation = Tween<Offset>(
      begin: Offset(0, 1.8), // Start from the top offscreen
      end: Offset(0, -0.25), // Move to the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn,
      ),
    );

    _centerRotationAnimation = Tween<double>(
      begin: 0,
      end: 0, // Final rotation
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: 300), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _rightCardAnimation.value *
                      MediaQuery.of(context).size.width /
                      1.7,
                  child: Transform.rotate(
                    angle: _rightRotationAnimation.value,
                    child: cardWidget2(Colors.white, "Jenny Wilson"),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _leftCardAnimation.value *
                      MediaQuery.of(context).size.width /
                      1.7,
                  child: Transform.rotate(
                    angle: _leftRotationAnimation.value,
                    child: cardWidget1(Colors.white, "Robert Fox"),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _centerCardAnimation.value *
                      MediaQuery.of(context).size.width /
                      1.7,
                  child: Transform.rotate(
                    angle: _centerRotationAnimation.value,
                    child: cardWidget(Colors.white, 'Hey!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidget(Color color, String text) {
    return Container(
      width: 100,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2)
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '👋',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardWidget1(Color color, String text) {
    return Container(
      width: 159.09,
      height: 214.94,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.92),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2)
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 135,
                  width: 125.24,
                  decoration: BoxDecoration(
                    color: Color(0xff2654FF),
                    borderRadius: BorderRadius.circular(16.92),
                  ),
                ),
                Positioned(
                  top: -12,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.92),
                    child: Image.asset(
                      ImageStrings.card1image,
                      width: 125.24,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            text,
            style: TextStyle(
              color: Color(0xff080816),
              fontSize: 13.54,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.interbold,
            ),
          ),
          Text(
            'Social Speaker',
            style: TextStyle(
              color: Color(0xff676767),
              fontSize: 11,
              fontFamily: AppFonts.interregular,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardWidget2(Color color, String text) {
    return Container(
      width: 159.09,
      height: 214.94,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.92),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2)
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 135,
                  width: 125.24,
                  decoration: BoxDecoration(
                    color: Color(0xffFFD62E),
                    borderRadius: BorderRadius.circular(16.92),
                  ),
                ),
                Positioned(
                  top: -16,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.92),
                    child: Image.asset(
                      ImageStrings.card2image,
                      width: 125.24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            text,
            style: TextStyle(
              color: Color(0xff080816),
              fontSize: 13.54,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.interbold,
            ),
          ),
          Text(
            'Social Speaker',
            style: TextStyle(
              color: Color(0xff676767),
              fontSize: 11,
              fontFamily: AppFonts.interregular,
            ),
          ),
        ],
      ),
    );
  }
}
