import 'package:a_village/utils/constants/colors.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/app_fonts.dart';

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 156,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? TColors.blue : TColors.inactivesubscription,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: TColors.placeholder,
                        fontFamily: AppFonts.interregular,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.interbold,
                        color: TColors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: TColors.trialbox,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "1 week Free Trial",
                        style: TextStyle(
                          fontSize: 13,
                          color: TColors.trialtext,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.interregular,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFonts.interregular,
                        fontWeight: FontWeight.w400,
                        color: TColors.placeholder,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 21, right: 15),
                child: Image.asset(
                  ImageStrings.radioselected,
                  height: 26,
                  width: 26,
                ),
              ),
            ),
          if (!isSelected)
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 21, right: 15),
                child: Image.asset(
                  ImageStrings.radiounselected,
                  height: 26,
                  width: 26,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
