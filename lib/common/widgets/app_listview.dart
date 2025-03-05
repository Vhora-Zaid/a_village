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
                          Icons.circle,
                          color: TColors.online,
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
  List<String> profileImages;
  List<String> names;
  List<String> messages;
  List<String> timestamps;
  Function(int index) onTap;
  double height;
  double width;

  AppListViewVertical({
    super.key,
    required this.profileImages,
    required this.names,
    required this.messages,
    required this.timestamps,
    required this.onTap,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: names.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () => onTap(index),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListTile(
                  leading: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          profileImages[index % profileImages.length],
                        ),
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
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: TColors.black,
                        ),
                      ),
                      Text(
                        timestamps[index],
                        style: const TextStyle(
                          fontFamily: AppFonts.interregular,
                          fontSize: 12,
                          color: TColors.timestampcolor,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      messages[index],
                      style: const TextStyle(
                        fontFamily: AppFonts.interregular,
                        fontSize: 14,
                        color: TColors.messagecolor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Divider(
                height: 1,
                color: TColors.stroke,
              ),
            )
          ],
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
                              color: profile['isOnline']
                                  ? TColors.online
                                  : TColors.offline,
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

class MatchesView extends StatelessWidget {
  const MatchesView({super.key});

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
                              color: profile['isOnline']
                                  ? TColors.online
                                  : TColors.offline,
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

