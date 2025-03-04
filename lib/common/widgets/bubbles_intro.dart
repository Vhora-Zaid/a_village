import 'package:flutter/material.dart';
import 'dart:math';

class BubbleAnimationScreen extends StatefulWidget {
  const BubbleAnimationScreen({super.key});

  @override
  _BubbleAnimationScreenState createState() => _BubbleAnimationScreenState();
}

class _BubbleAnimationScreenState extends State<BubbleAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();
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
      body: Stack(
        children: [
          for (var bubble in bubbles)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double progress = _controller.value;
                return Positioned(
                  left: lerp(bubble.initial.dx, bubble.finalPos.dx, progress),
                  top: lerp(bubble.initial.dy, bubble.finalPos.dy, progress),
                  child: Transform.rotate(
                    angle: lerp(bubble.initialRotation, bubble.finalRotation, progress),
                    child: Transform.scale(
                      scale: lerp(bubble.initialSize, bubble.finalSize, progress),
                      child: Opacity(
                        opacity: lerp(0, 1, progress),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(bubble.topLeftRadius),
                              topRight: Radius.circular(bubble.topRightRadius),
                              bottomLeft: Radius.circular(bubble.bottomLeftRadius),
                              bottomRight: Radius.circular(bubble.bottomRightRadius),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(bubble.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  double lerp(double start, double end, double progress) {
    return start + (end - start) * progress;
  }
}

class Bubble {
  final Offset initial;
  final Offset finalPos;
  final double initialSize;
  final double finalSize;
  final double initialRotation;
  final double finalRotation;
  final String image;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;

  Bubble({
    required this.initial,
    required this.finalPos,
    required this.initialSize,
    required this.finalSize,
    required this.initialRotation,
    required this.finalRotation,
    required this.image,
    required this.topLeftRadius,
    required this.topRightRadius,
    required this.bottomLeftRadius,
    required this.bottomRightRadius,
  });
}


List<Bubble> bubbles = [
  Bubble(
    initial: Offset(500, 100),
    finalPos: Offset(55, 120),
    initialSize: 0.5,
    finalSize: 1.0,
    initialRotation: -pi / 4,
    finalRotation: 0,
    image: 'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3.png',
    topLeftRadius: 15,
    topRightRadius: 50,
    bottomLeftRadius: 50,
    bottomRightRadius: 50,
  ),
  Bubble(
    initial: Offset(300, 900),
    finalPos: Offset(125, 100),
    initialSize: 0.3,
    finalSize: 1.2,
    initialRotation: pi / 6,
    finalRotation: 0,
    image: 'https://pikwizard.com/pw/small/75a32465b8895bdcd79b4bd3a6a3a72e.jpg',
    topLeftRadius: 50,
    topRightRadius: 15,
    bottomLeftRadius: 50,
    bottomRightRadius: 50,
  ),
  Bubble(
    initial: Offset(400, 800),
    finalPos: Offset(215, 80),
    initialSize: 0.6,
    finalSize: 1.5,
    initialRotation: -pi / 6,
    finalRotation: 0,
    image: 'https://d2az3zd39o5d63.cloudfront.net/linkedin-profile-picture-squinch.jpg',
    topLeftRadius: 50,
    topRightRadius: 50,
    bottomLeftRadius: 15,
    bottomRightRadius: 50,
  ),
  Bubble(
    initial: Offset(200, 900),
    finalPos: Offset(185, 170),
    initialSize: 0.4,
    finalSize: 1.2,
    initialRotation: pi / 8,
    finalRotation: 0,
    image: 'https://imgcdn.stablediffusionweb.com/2024/5/2/0b0209ce-412b-49cd-a30b-60d907adc7e4.jpg',
    topLeftRadius: 15,
    topRightRadius: 50,
    bottomLeftRadius: 50,
    bottomRightRadius: 50,
  ),
  Bubble(
    initial: Offset(300, 900),
    finalPos: Offset(95, 185),
    initialSize: 0.5,
    finalSize: 1.3,
    initialRotation: -pi / 5,
    finalRotation: 0,
    image: 'https://writestylesonline.com/wp-content/uploads/2018/11/Three-Statistics-That-Will-Make-You-Rethink-Your-Professional-Profile-Picture-1024x1024.jpg',
    topLeftRadius: 50,
    topRightRadius: 15,
    bottomLeftRadius: 50,
    bottomRightRadius: 50,
  ),
  Bubble(
    initial: Offset(500, 500),
    finalPos: Offset(95, 270),
    initialSize: 0.5,
    finalSize: 1.3,
    initialRotation: -pi / 5,
    finalRotation: 0,
    image: 'https://www.perfocal.com/blog/content/images/2020/07/Perfocal_Male_Dating_Profile.jpg',
    topLeftRadius: 50,
    topRightRadius: 15,
    bottomLeftRadius: 50,
    bottomRightRadius: 50,
  ),
  Bubble(
    initial: Offset(400, 800),
    finalPos: Offset(180, 250),
    initialSize: 0.5,
    finalSize: 1.3,
    initialRotation: -pi / 5,
    finalRotation: 0,
    image: 'https://static.vecteezy.com/system/resources/thumbnails/038/894/374/small/ai-generated-young-happy-pretty-smiling-professional-asian-business-woman-happy-confident-positive-female-entrepreneur-photo.jpg',
    topLeftRadius: 15,
    topRightRadius: 50,
    bottomLeftRadius: 50,
    bottomRightRadius: 50,
  ),
  Bubble(
    initial: Offset(500, 850),
    finalPos: Offset(245, 210),
    initialSize: 0.5,
    finalSize: 1.0,
    initialRotation: -pi / 5,
    finalRotation: 0,
    image: 'https://images.unsplash.com/photo-1537511446984-935f663eb1f4?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZmVzc2lvbmFsJTIwbWFufGVufDB8fDB8fHww',
    topLeftRadius: 50,
    topRightRadius: 15,
    bottomLeftRadius: 50,
    bottomRightRadius: 50,
  ),
  Bubble(
    initial: Offset(500, 850),
    finalPos: Offset(250, 150),
    initialSize: 0.5,
    finalSize: 0.7,
    initialRotation: -pi / 5,
    finalRotation: 0,
    image: 'https://wallpapers.com/images/featured/plain-light-blue-background-qsh4vg301jaeexzt.jpg',
    topLeftRadius: 50,
    topRightRadius: 50,
    bottomLeftRadius: 15,
    bottomRightRadius: 50,
  ),
  Bubble(
    initial: Offset(300, 900),
    finalPos: Offset(15, 175),
    initialSize: 0.3,
    finalSize: 0.8,
    initialRotation: pi / 6,
    finalRotation: 0,
    image: 'https://www.asianpaints.com/content/dam/asian_paints/colours/swatches/8780.png.transform/cc-width-720-height-540/image.png',
    topLeftRadius: 50,
    topRightRadius: 50,
    bottomLeftRadius: 50,
    bottomRightRadius: 15,
  ),
  Bubble(
    initial: Offset(300, 900),
    finalPos: Offset(35, 230),
    initialSize: 0.3,
    finalSize: 0.8,
    initialRotation: pi / 6,
    finalRotation: 0,
    image: 'https://htmlcolorcodes.com/assets/images/colors/light-purple-color-solid-background-1920x1080.png',
    topLeftRadius: 50,
    topRightRadius: 15,
    bottomLeftRadius: 50,
    bottomRightRadius: 50,
  ),
];