import 'package:a_village/common/widgets/app_appbar.dart';
import 'package:a_village/common/widgets/app_button.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/widgets/subscription_card.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/image_strings.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String _selectedPlan = "monthly";

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
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.subscription,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                AppLocalizations.of(context)!.chooseplan,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 14,
                  color: TColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Column(
                children: [
                  SubscriptionCard(
                    title: AppLocalizations.of(context)!.monthly,
                    price: AppLocalizations.of(context)!.monthlyprice,
                    description: AppLocalizations.of(context)!.monthlypricedesc,
                    isSelected: _selectedPlan == "monthly",
                    onTap: () {
                      setState(() {
                        _selectedPlan = "monthly";
                      });
                    },
                  ),
                  SizedBox(height: 7),
                  SubscriptionCard(
                    title: AppLocalizations.of(context)!.yearly,
                    price: AppLocalizations.of(context)!.yearlyprice,
                    description: AppLocalizations.of(context)!.yearlypricedesc,
                    isSelected: _selectedPlan == "yearly",
                    onTap: () {
                      setState(() {
                        _selectedPlan = "yearly";
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 30),
        child: AppButton(
            title: AppLocalizations.of(context)!.subscribenow,
            onTap: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
