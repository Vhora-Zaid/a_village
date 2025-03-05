import 'package:a_village/features/intro/second_intro_screen.dart';
import 'package:a_village/features/intro/third_intro_screen.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../login/login_screen.dart';
import 'first_intro_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: 3,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return FirstIntroScreen(
                onNext: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              );
            case 1:
              return SecondIntroScreen(
                onNext: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              );
            case 2:
              return ThirdIntroScreen(
                onDone: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
      bottomNavigationBar: Container(
        color: TColors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 30, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        width: 20,
                        height: 4,
                        color: _currentPage == index
                            ? const Color(0xff2353FF)
                            : const Color(0xffD9D9D9),
                      ),
                    );
                  },
                ),
              ),
              // Next Button
              GestureDetector(
                onTap: () {
                  if (_currentPage < 2) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                },
                child: Image.asset(
                  ImageStrings.nextbutton,
                  height: 58,
                  width: 58,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
