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
                  fontSize: 15,
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
                    StatefulBuilder(
                      builder: (context, setState) {
                        return TextFormField(
                          controller: _subjectController,
                          keyboardType: TextInputType.text,
                          cursorColor: TColors.placeholder,
                          onTapOutside: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter Subject';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                          },
                          decoration: InputDecoration(
                            hintText: 'Subject',
                            hintStyle: TextStyle(color: TColors.placeholder),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffDBDDE2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffDBDDE2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffDBDDE2),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffDBDDE2),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffDBDDE2),
                                width: 1,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return TextFormField(
                          controller: _messageController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter Message';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                          },
                          onTapOutside: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          cursorColor: TColors.placeholder,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Message',
                            hintStyle: TextStyle(color: TColors.placeholder),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffDBDDE2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffDBDDE2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffDBDDE2),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffDBDDE2),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffDBDDE2),
                                width: 1,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 30, top: 20, left: 16, right: 16),
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
}
