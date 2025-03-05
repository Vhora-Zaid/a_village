import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_fonts.dart';

class MatchedAnimation extends StatefulWidget {
  const MatchedAnimation({super.key});

  @override
  _MatchedAnimationState createState() => _MatchedAnimationState();
}

class _MatchedAnimationState extends State<MatchedAnimation>
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
      end: Offset(-0.67, 0), // Move to the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _rightCardAnimation = Tween<Offset>(
      begin: Offset(2, 0), // Start from the right offscreen
      end: Offset(0.67, 0), // Move to the center
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _leftRotationAnimation = Tween<double>(
      begin: -0.2, // Initial rotation in radians (slightly tilted left)
      end: -0.15, // Final rotation
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _rightRotationAnimation = Tween<double>(
      begin: 0.2, // Initial rotation in radians (slightly tilted right)
      end: 0.15, // Final rotation
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _centerCardAnimation = Tween<Offset>(
      begin: Offset(0, 0.25), // Start from the top offscreen
      end: Offset(0, -0.46), // Move to the center
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
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _leftCardAnimation.value *
                      MediaQuery.of(context).size.width /
                      3.2,
                  child: Transform.rotate(
                    angle: _leftRotationAnimation.value,
                    child: cardWidget1(Colors.white, "Leslie Alexander"),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _rightCardAnimation.value *
                      MediaQuery.of(context).size.width /
                      3.2,
                  child: Transform.rotate(
                    angle: _rightRotationAnimation.value,
                    child: cardWidget2(Colors.white, "Wade Warren"),
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
                    child: cardWidget(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidget() {
    return Image.asset(
      ImageStrings.matchedheart,
      scale: 4,
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
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              height: 135,
              width: 125.24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageStrings.matchedleft),
                ),
                borderRadius: BorderRadius.circular(15)
              ),
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
            'Falk Dancer',
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
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              height: 135,
              width: 125.24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageStrings.matchedright),
                  ),
                  borderRadius: BorderRadius.circular(15)
              ),
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
            'Motivational',
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
