import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_fonts.dart';

class HeartsIntro extends StatefulWidget {
  const HeartsIntro({super.key});

  @override
  _HeartsIntroAnimationState createState() => _HeartsIntroAnimationState();
}

class _HeartsIntroAnimationState extends State<HeartsIntro>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _leftCardAnimation;
  late Animation<Offset> _rightCardAnimation;
  late Animation<double> _leftRotationAnimation;
  late Animation<double> _rightRotationAnimation;
  late Animation<Offset> _centerCardAnimation;
  late Animation<double> _centerRotationAnimation;
  late Animation<double> _cardWidget3RotationAnimation;
  late Animation<Offset> _cardWidget3Animation;
  late Animation<double> _cardWidget4RotationAnimation;
  late Animation<Offset> _cardWidget4Animation;
  late Animation<double> _cardWidget5RotationAnimation;
  late Animation<Offset> _cardWidget5Animation;
  late Animation<double> _cardWidget6RotationAnimation;
  late Animation<Offset> _cardWidget6Animation;
  late Animation<double> _cardWidget7RotationAnimation;
  late Animation<Offset> _cardWidget7Animation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _leftCardAnimation = Tween<Offset>(
      begin: Offset(3, -5), // Start from the left offscreen
      end: Offset(-0.35, -0.3), // Move to the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _rightCardAnimation = Tween<Offset>(
      begin: Offset(-3, 5), // Start from the right offscreen
      end: Offset(0.52, 0.55), // Move to the center
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _leftRotationAnimation = Tween<double>(
      begin: -0.2, // Initial rotation in radians (slightly tilted left)
      end: -0.15, // Final rotation
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _rightRotationAnimation = Tween<double>(
      begin: 0.2, // Initial rotation in radians (slightly tilted right)
      end: 0.05, // Final rotation
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _centerCardAnimation = Tween<Offset>(
      begin: Offset(0, 2), // Start from the top offscreen
      end: Offset(-0.15, 0.20), // Move to the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn,
      ),
    );

    _centerRotationAnimation = Tween<double>(
      begin: 0,
      end: -0.4, // Final rotation
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _cardWidget3Animation = Tween<Offset>(
      begin: Offset(-3, -5), // Start from the left offscreen
      end: Offset(0.40, -0.5), // Move to the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _cardWidget3RotationAnimation = Tween<double>(
      begin: -0.2, // Initial rotation in radians (slightly tilted left)
      end: -0.15, // Final rotation
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _cardWidget4Animation = Tween<Offset>(
      begin: Offset(3, 8), // Start from the left offscreen
      end: Offset(0.65, -0.25), // Move to the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _cardWidget4RotationAnimation = Tween<double>(
      begin: -0.2, // Initial rotation in radians (slightly tilted left)
      end: -0.15, // Final rotation
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _cardWidget5Animation = Tween<Offset>(
      begin: Offset(-7, -3), // Start from the left offscreen
      end: Offset(-0.15, 0.45), // Move to the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _cardWidget5RotationAnimation = Tween<double>(
      begin: -0.2, // Initial rotation in radians (slightly tilted left)
      end: -0.15, // Final rotation
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _cardWidget6Animation = Tween<Offset>(
      begin: Offset(3, -5), // Start from the left offscreen
      end: Offset(-0.45, 0.50), // Move to the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _cardWidget6RotationAnimation = Tween<double>(
      begin: -0.2, // Initial rotation in radians (slightly tilted left)
      end: -0.15, // Final rotation
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _cardWidget7Animation = Tween<Offset>(
      begin: Offset(-9, -2), // Start from the left offscreen
      end: Offset(-0.65, 0.2), // Move to the center
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _cardWidget7RotationAnimation = Tween<double>(
      begin: -0.2, // Initial rotation in radians (slightly tilted left)
      end: -0.15, // Final rotation
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

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
                      3,
                  child: Transform.rotate(
                    angle: _leftRotationAnimation.value,
                    child: cardWidget1(),
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
                      4,
                  child: Transform.rotate(
                    angle: _rightRotationAnimation.value,
                    child: cardWidget2(),
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
                    child: cardWidget(Colors.white, 'Love'),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _cardWidget3Animation.value *
                      MediaQuery.of(context).size.width /
                      1.7,
                  child: Transform.rotate(
                    angle: _cardWidget3RotationAnimation.value,
                    child: cardWidget3(),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _cardWidget4Animation.value *
                      MediaQuery.of(context).size.width /
                      1.7,
                  child: Transform.rotate(
                    angle: _cardWidget4RotationAnimation.value,
                    child: cardWidget4(),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _cardWidget5Animation.value *
                      MediaQuery.of(context).size.width /
                      1.7,
                  child: Transform.rotate(
                    angle: _cardWidget5RotationAnimation.value,
                    child: cardWidget5(),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _cardWidget6Animation.value *
                      MediaQuery.of(context).size.width /
                      1.7,
                  child: Transform.rotate(
                    angle: _cardWidget6RotationAnimation.value,
                    child: cardWidget6(),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _cardWidget7Animation.value *
                      MediaQuery.of(context).size.width /
                      1.7,
                  child: Transform.rotate(
                    angle: _cardWidget7RotationAnimation.value,
                    child: cardWidget7(),
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
            '❤️',
            style: TextStyle(fontSize: 20),
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

  Widget cardWidget1() {
    return Image.asset(ImageStrings.card3image);
  }

  Widget cardWidget2() {
    return Image.asset(ImageStrings.card4image);
  }

  Widget cardWidget3() {
    return Image.asset(
      ImageStrings.cardwidget3,
      height: 35.12,
      width: 42,
    );
  }

  Widget cardWidget4() {
    return Image.asset(
      ImageStrings.cardwidget4,
      height: 35,
      width: 35,
    );
  }

  Widget cardWidget5() {
    return Image.asset(
      ImageStrings.cardwidget5,
      height: 22.95,
      width: 26,
    );
  }

  Widget cardWidget6() {
    return Image.asset(
      ImageStrings.cardwidget6,
      height: 44.54,
      width: 35.89,
    );
  }

  Widget cardWidget7() {
    return Image.asset(
      ImageStrings.cardwidget7,
      height: 35,
      width: 35,
    );
  }
}
