import 'package:a_village/utils/constants/app_fonts.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';

import '../../features/user profile/user_profile_screen.dart';

class HomeCards extends StatefulWidget {
  const HomeCards({super.key});

  @override
  State<HomeCards> createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  final CardSwiperController _controller = CardSwiperController();

  List<Profile> cards = [
    const Profile(
      location: 'California',
      name: 'Angel',
      age: '27',
      description:
          'Hey there. My name is Angel and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Art',
      ],
      networkImage:
          'https://imgs.search.brave.com/mRib_i-Szar0NIbygBBAm9WO0KitFDrDrjbum_HIfwg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvODY0/NTE2ODcwL3Bob3Rv/L3lvdW5nLXdvbWFu/LXBob3RvZ3JhcGhp/bmctdGhlLWF1dHVt/bi1zZWFzb24uanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPU0z/RzJTd0tKMTV6b2xz/U2FGQUJzbmVMaXRk/V1hDcnJKM0xrVEVL/bklPeXM9',
    ),
    const Profile(
      location: 'New York',
      name: 'Maria',
      age: '29',
      description:
          'Hey there. My name is Maria and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Art',
        'Music',
      ],
      networkImage:
          'https://imgs.search.brave.com/mRib_i-Szar0NIbygBBAm9WO0KitFDrDrjbum_HIfwg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvODY0/NTE2ODcwL3Bob3Rv/L3lvdW5nLXdvbWFu/LXBob3RvZ3JhcGhp/bmctdGhlLWF1dHVt/bi1zZWFzb24uanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPU0z/RzJTd0tKMTV6b2xz/U2FGQUJzbmVMaXRk/V1hDcnJKM0xrVEVL/bklPeXM9',
    ),
    const Profile(
      location: 'Amsterdam',
      name: 'Cathy',
      age: '25',
      description:
          'Hey there. My name is Cathy and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Music',
        'Gaming',
        'Architecture',
      ],
      networkImage:
          'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
    ),
    const Profile(
      location: 'USA',
      name: 'Jenny',
      age: '29',
      description:
          'Hey there. My name is Jenny and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Fashion',
        'Photography',
      ],
      networkImage:
          'https://imgs.search.brave.com/mRib_i-Szar0NIbygBBAm9WO0KitFDrDrjbum_HIfwg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvODY0/NTE2ODcwL3Bob3Rv/L3lvdW5nLXdvbWFu/LXBob3RvZ3JhcGhp/bmctdGhlLWF1dHVt/bi1zZWFzb24uanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPU0z/RzJTd0tKMTV6b2xz/U2FGQUJzbmVMaXRk/V1hDcnJKM0xrVEVL/bklPeXM9',
    ),
    const Profile(
      location: 'London',
      name: 'Rohini',
      age: '24',
      description:
          'Hey there. My name is Rohini and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Writing',
        'Movie',
      ],
      networkImage:
          'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
    ),
    const Profile(
      location: 'California',
      name: 'Cameron',
      age: '27',
      description:
          'Hey there. My name is Cameron and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Art',
        'Fashion',
        'Photography',
      ],
      networkImage:
          'https://imgs.search.brave.com/mRib_i-Szar0NIbygBBAm9WO0KitFDrDrjbum_HIfwg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvODY0/NTE2ODcwL3Bob3Rv/L3lvdW5nLXdvbWFu/LXBob3RvZ3JhcGhp/bmctdGhlLWF1dHVt/bi1zZWFzb24uanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPU0z/RzJTd0tKMTV6b2xz/U2FGQUJzbmVMaXRk/V1hDcnJKM0xrVEVL/bklPeXM9',
    ),
    const Profile(
      location: 'New York',
      name: 'Eleanor',
      age: '26',
      description:
          'Hey there. My name is Eleanor and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Art',
        'Fashion',
        'Photography',
      ],
      networkImage:
          'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
    ),
    const Profile(
      location: 'California',
      name: 'Cody',
      age: '27',
      description:
          'Hey there. My name is Cody and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Art',
        'Fashion',
        'Photography',
      ],
      networkImage:
          'https://imgs.search.brave.com/mRib_i-Szar0NIbygBBAm9WO0KitFDrDrjbum_HIfwg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvODY0/NTE2ODcwL3Bob3Rv/L3lvdW5nLXdvbWFu/LXBob3RvZ3JhcGhp/bmctdGhlLWF1dHVt/bi1zZWFzb24uanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPU0z/RzJTd0tKMTV6b2xz/U2FGQUJzbmVMaXRk/V1hDcnJKM0xrVEVL/bklPeXM9',
    ),
    const Profile(
      location: 'California',
      name: 'Savannah',
      age: '27',
      description:
          'Hey there. My name is Savannah and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Art',
        'Fashion',
        'Photography',
      ],
      networkImage:
          'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
    ),
    const Profile(
      location: 'California',
      name: 'Annette',
      age: '27',
      description:
          'Hey there. My name is Annette and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Art',
        'Fashion',
        'Photography',
      ],
      networkImage:
          'https://imgs.search.brave.com/mRib_i-Szar0NIbygBBAm9WO0KitFDrDrjbum_HIfwg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvODY0/NTE2ODcwL3Bob3Rv/L3lvdW5nLXdvbWFu/LXBob3RvZ3JhcGhp/bmctdGhlLWF1dHVt/bi1zZWFzb24uanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPU0z/RzJTd0tKMTV6b2xz/U2FGQUJzbmVMaXRk/V1hDcnJKM0xrVEVL/bklPeXM9',
    ),
    const Profile(
      location: 'California',
      name: 'Lisa',
      age: '27',
      description:
          'Hey there. My name is Lisa and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Art',
        'Fashion',
        'Photography',
      ],
      networkImage:
          'https://imgs.search.brave.com/sZwPP2aqmX7MMiXBJF-nqQW8lJw_UVLZzlX7oyAMwJ8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS8xNGhFNHVSc0Y2/dllsRDA1anV1WGdh/SDl6NHJsMlZqajdE/aDY1b3BRZFV4UERE/TjRVTnQ2VUJiSjVB/NVFOdTN1eUx4Wj13/MjQwLWg0ODAtcnc',
    ),
    const Profile(
      location: 'California',
      name: 'Jacob',
      age: '27',
      description:
          'Hey there. My name is Jacob and I\'m a fashion photographer. I love going to convert and festivals.',
      interests: [
        'Art',
        'Fashion',
        'Photography',
      ],
      networkImage:
          'https://imgs.search.brave.com/mRib_i-Szar0NIbygBBAm9WO0KitFDrDrjbum_HIfwg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvODY0/NTE2ODcwL3Bob3Rv/L3lvdW5nLXdvbWFu/LXBob3RvZ3JhcGhp/bmctdGhlLWF1dHVt/bi1zZWFzb24uanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPU0z/RzJTd0tKMTV6b2xz/U2FGQUJzbmVMaXRk/V1hDcnJKM0xrVEVL/bklPeXM9',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CardSwiper(
            controller: _controller,
            padding: EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 25),
            allowedSwipeDirection: AllowedSwipeDirection.only(
              down: false,
              up: true,
              left: true,
              right: true,
            ),
            threshold: 100,
            numberOfCardsDisplayed: 3,
            cardsCount: cards.length,
            backCardOffset: Offset(0, 37),
            cardBuilder:
                (context, index, percentThresholdX, percentThresholdY) =>
                    ProfileCard(
              profile: cards[index],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xffF6F1D3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedActionButton(
                  onPressed: () => _triggerSwipe(CardSwiperDirection.left),
                  image: ImageStrings.homeclose,
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                const SizedBox(width: 5),
                AnimatedActionButton(
                  onPressed: () => _triggerSwipe(CardSwiperDirection.top),
                  image: ImageStrings.homefavorite,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffCD75FF),
                      Color(0xff2353FF),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                const SizedBox(width: 5),
                AnimatedActionButton(
                  onPressed: () => _triggerSwipe(CardSwiperDirection.right),
                  image: ImageStrings.homecheck,
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _triggerSwipe(CardSwiperDirection direction) {
    Future.delayed(const Duration(milliseconds: 200), () {
      _controller.swipe(direction);
    });
  }
}

class Profile {
  const Profile({
    required this.location,
    required this.name,
    required this.age,
    required this.description,
    required this.interests,
    required this.networkImage,
  });
  final String location;
  final String age;
  final String description;
  final List<String> interests;
  final String name;
  final String networkImage;
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfileScreen(),
              ),
            );
          },
          child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(profile.networkImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //     color: Color(0xffEEEEEE),
              //     spreadRadius: -22,
              //     blurRadius: 0,
              //     offset: Offset(0, 44),
              //   ),
              //   BoxShadow(
              //     color: Color(0xffD8D8D8),
              //     spreadRadius: -12,
              //     blurRadius: 0,
              //     offset: Offset(0, 25),
              //   ),
              // ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.03,
                  right: screenWidth * 0.03,
                  bottom: screenHeight * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 9,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            ImageStrings.location,
                            scale: 4,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            profile.location,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFonts.interbold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name,
                        style: TextStyle(
                          fontSize: 37,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.interbold,
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        profile.age,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.interbold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    profile.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: AppFonts.interregular,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                    children: [
                      Wrap(
                        spacing: 5,
                        children: profile.interests.map((interest) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 13),
                                child: Text(
                                  interest,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFonts.interregular,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedActionButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String image;
  final Gradient gradient;

  const AnimatedActionButton({
    super.key,
    required this.onPressed,
    required this.image,
    required this.gradient,
  });

  @override
  _AnimatedActionButtonState createState() => _AnimatedActionButtonState();
}

class _AnimatedActionButtonState extends State<AnimatedActionButton> {
  double _scale = 1.0;

  void _onTapDown(_) {
    setState(() => _scale = 0.9);
  }

  void _onTapUp(_) {
    setState(() => _scale = 1.0);
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.005,
          ),
          child: Container(
            height: screenHeight * 0.08,
            width: screenWidth * 0.285,
            decoration: BoxDecoration(
              gradient: widget.gradient,
              borderRadius: BorderRadius.circular(screenWidth * 0.1),
            ),
            child: Center(
              child: Image.asset(
                widget.image,
                height: 24,
                width: screenWidth * 0.1,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
