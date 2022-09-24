import 'package:flutter/material.dart';
import 'package:odc_bootcamp/view/screens/parterner_screen/partner_screen.dart';
import 'package:odc_bootcamp/view/screens/support_screen/support_screen.dart';
import 'package:odc_bootcamp/view/screens/terms_screen/terms_screen.dart';

import '../../../shared/components.dart';
import '../../components/settings_components/settings_components.dart';
import '../faq_screen/faq_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                child: buildListTile('FAQ'),
                onTap: () {
                  navigateTo(context, const FAQScreen());
                },
              ),
              customDivider(),
              InkWell(
                child: buildListTile('Terms & Conditions'),
                onTap: () {
                  navigateTo(context, const TermsScreen());
                },
              ),
              customDivider(),
              InkWell(
                child: buildListTile('Our Partenrs'),
                onTap: () {
                  navigateTo(context, const PartnerScreen());
                },
              ),
              customDivider(),
              InkWell(
                child: buildListTile('Support'),
                onTap: () {
                  navigateTo(context, SupportScreen());
                },
              ),
              customDivider(),
              InkWell(
                child: buildListTile('Log out'),
                onTap: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
