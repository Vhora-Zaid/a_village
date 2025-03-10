import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  Widget _buildContactCard({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Card(
      shadowColor: TColors.black,
      color: TColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 22,
              width: 22,
              color: TColors.blue,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: TColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.interregular,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: TColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.interregular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: MyAppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              ImageStrings.backarrow,
              height: 44,
              width: 44,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Us',
                style: TextStyle(
                  color: TColors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.interbold,
                ),
              ),
              Center(
                child: Image.asset(
                  ImageStrings.contactvector,
                  height: 220,
                  width: 220,
                ),
              ),
              Text(
                'Please feel free to reach out if you have any questions, feedback, or need support.',
                style: TextStyle(
                  color: TColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.interregular,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              _buildContactCard(
                imagePath: ImageStrings.email,
                title: 'Email',
                subtitle: 'avillage@support.com',
              ),
              const SizedBox(height: 16),
              _buildContactCard(
                imagePath: ImageStrings.call,
                title: 'Phone',
                subtitle: '+1 (234) 567-8901',
              ),
              const SizedBox(height: 16),
              _buildContactCard(
                imagePath: ImageStrings.location,
                title: 'Address',
                subtitle: '123 Main Street,\nNew York, NY 10001',
              ),
            ],
          ),
        ),
      )
    );
  }
}
