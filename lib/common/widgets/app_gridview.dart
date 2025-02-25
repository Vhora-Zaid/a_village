import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class SelectableGrid extends StatefulWidget {
  const SelectableGrid({super.key});

  @override
  _SelectableGridState createState() => _SelectableGridState();
}

class _SelectableGridState extends State<SelectableGrid> {
  List<bool> selectedItems = List.filled(6, false);

  get categoryNames => [
    AppLocalizations.of(context)!.love,
    AppLocalizations.of(context)!.friends,
    AppLocalizations.of(context)!.business,
    AppLocalizations.of(context)!.fling,
    AppLocalizations.of(context)!.male,
    AppLocalizations.of(context)!.female
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedItems[index] = !selectedItems[index];
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  height: 144,
                  width: 164,
                  decoration: BoxDecoration(
                    border: selectedItems[index]
                      ? null
                      : Border.all(
                          color: TColors.bordercolor,
                          width: 1,
                        ),
                    color: selectedItems[index] ? TColors.yellow : TColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 67,
                          width: 67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: selectedItems[index] ? TColors.white : Color(0xffFFFAE8),
                          ),
                          child: Image.asset(
                            [
                              ImageStrings.love,
                              ImageStrings.friends,
                              ImageStrings.business,
                              ImageStrings.fling,
                              ImageStrings.male,
                              ImageStrings.female,
                            ][index],
                            scale: 4,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          categoryNames[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppFonts.interregular,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: TColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: selectedItems[index]
                    ? Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: TColors.yellow,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          ImageStrings.tick,
                          scale: 4,
                        ),
                      ),
                    )
                    : Container(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppGridViewForPhotos extends StatelessWidget {
  final List<String> items;
  final List<bool> selectedItems;
  final Function(int index) onTap;
  final String addImage;

  const AppGridViewForPhotos({
    Key? key,
    required this.items,
    required this.selectedItems,
    required this.onTap,
    required this.addImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        if (index == items.length) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffFFFAE8),
              ),
              child: Image.asset(
                addImage,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedItems[index] ? TColors.white : Color(0xffFFFAE8),
              ),
              child: Image.asset(
                items[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        }
      },
    );
  }
}