import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/app_button.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
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
              const SizedBox(height: 16),
              Center(
                child: Image.asset(
                  ImageStrings.contactvector,
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(height: 12),
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

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildInputField(
                      controller: _emailController,
                      label: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      controller: _subjectController,
                      label: 'Subject',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      controller: _messageController,
                      label: 'Message',
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, top: 20, left: 16, right: 16),
        child: AppButton(
          title: 'Send Message',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Message sent!")),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: TColors.grey,
          fontFamily: AppFonts.interregular,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: TColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: TColors.blue),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
