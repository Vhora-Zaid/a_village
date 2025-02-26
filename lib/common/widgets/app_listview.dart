import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';

class AppListView extends StatelessWidget {
  const AppListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      SizedBox(
                        height: 72.9,
                        width: 72.9,
                        child: CircleAvatar(
                          child: Image(
                            image: AssetImage(
                              index == 0
                                  ? ImageStrings.profile1
                                  : index == 1
                                      ? ImageStrings.profile2
                                      : index == 2
                                          ? ImageStrings.profile3
                                          : index == 3
                                              ? ImageStrings.profile4
                                              : index == 4
                                                  ? ImageStrings.profile5
                                                  : index == 5
                                                      ? ImageStrings.profile6
                                                      : index == 6
                                                          ? ImageStrings
                                                              .profile7
                                                          : ImageStrings
                                                              .profile8,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Icon(
                          index.isEven ? Icons.circle : Icons.circle,
                          color:
                              index.isEven ? TColors.online : TColors.offline,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    index == 0
                        ? 'Susie S'
                        : index == 1
                            ? 'Irene D'
                            : index == 2
                                ? 'May F'
                                : index == 3
                                    ? 'Tillie B'
                                    : index == 4
                                        ? 'Madison'
                                        : index == 5
                                            ? 'Ashley'
                                            : index == 6
                                                ? 'Abigail'
                                                : 'Sarah',
                    style: TextStyle(
                      fontFamily: AppFonts.interregular,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: TColors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AppListViewVertical extends StatelessWidget {
  AppListViewVertical({super.key});

  final List<String> profileImages = [
    ImageStrings.profile1,
    ImageStrings.profile2,
    ImageStrings.profile3,
    ImageStrings.profile4,
    ImageStrings.profile5,
    ImageStrings.profile6,
    ImageStrings.profile7,
    ImageStrings.profile8,
  ];

  final List<String> names = [
    'Stella Walsh',
    'Lottie Glover',
    'Mildred Butler',
    'Stella Walsh',
    'Victoria Norris',
    'Maggie Price',
    'Stella Walsh',
    'Esther Kim',
  ];

  final List<String> messages = [
    'Hey! Hows it going?',
    'What kind of music do you like?',
    'Sounds good to me!',
    'Hey! Hows it going?',
    'Hey! Hows it going?',
    'Hey! Hows it going?',
    'Hey! Hows it going?',
    'Hey! Hows it going?',
  ];

  final List<String> timestamps = [
    'A week ago',
    '07 Apr 2023',
    '24 Apr 2023',
    '01 Oct 2023',
    '08 Apr 2023',
    '18 Aug 2023',
    '06 Apr 2023',
    '14 Mar 2023',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 5),
      itemCount: names.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image:
                    AssetImage(profileImages[index % profileImages.length]),
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                names[index],
                style: const TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: TColors.black,
                ),
              ),
              Text(
                timestamps[index],
                style: const TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 12,
                  color: TColors.grey,
                ),
              ),
            ],
          ),
          subtitle: Text(
            messages[index],
            style: const TextStyle(
              fontFamily: AppFonts.interregular,
              fontSize: 13,
              color: TColors.grey,
            ),
          ),
        );
      },
    );
  }
}

class AppListViewFavorites extends StatelessWidget {
  const AppListViewFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profiles = [
      {
        'imageUrl': ImageStrings.profile1,
        'name': 'Eleanor Pena',
        'age': 20,
        'status': 'Online',
        'isOnline': true,
        'location': 'Toledo'
      },
      {
        'imageUrl': ImageStrings.profile2,
        'name': 'Jenny Wilson',
        'age': 24,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Austin'
      },
      {
        'imageUrl': ImageStrings.profile3,
        'name': 'Jacob Jones',
        'age': 28,
        'status': 'Online',
        'isOnline': true,
        'location': 'Toledo'
      },
      {
        'imageUrl': ImageStrings.profile4,
        'name': 'Cameron Pena',
        'age': 30,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Fairfield'
      },
      {
        'imageUrl': ImageStrings.profile5,
        'name': 'Savannah Nguy',
        'age': 21,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Naperville'
      },
      {
        'imageUrl': ImageStrings.profile6,
        'name': 'Annette Black',
        'age': 31,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Orange'
      },
      {
        'imageUrl': ImageStrings.profile7,
        'name': 'Cody Fisher',
        'age': 32,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Pembroke Pines'
      },
      {
        'imageUrl': ImageStrings.profile8,
        'name': 'Emily Davis',
        'age': 25,
        'status': 'Offline',
        'isOnline': false,
        'location': 'Fairfield'
      }
    ];

    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 5),
        itemCount: profiles.length,
        itemBuilder: (BuildContext context, int index) {
          final profile = profiles[index % profiles.length];
          return Card(
            elevation: 0,
            color: TColors.favoritecard,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: Container(
              height: 110,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(profile['imageUrl']),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${profile['name']}, ${profile['age']}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.interbold,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              profile['isOnline'] ? Icons.circle : Icons.circle,
                              color: profile['isOnline'] ? TColors.online : TColors.offline,
                              size: 8,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              ImageStrings.location,
                              height: 18,
                              width: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              profile['location'] ?? 'Unknown Location',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.interregular,
                                fontWeight: FontWeight.w400,
                                color: TColors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      ImageStrings.favoriteinactive,
                      height: 24,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
