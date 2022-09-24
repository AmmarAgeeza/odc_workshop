import 'package:flutter/material.dart';
import 'package:odc_bootcamp/view/screens/lectures_screen/lectures_screen.dart';
import 'package:odc_bootcamp/view/screens/midterms_screen/midterms_screen.dart';
import 'package:odc_bootcamp/view/screens/sections_screen/sections_screen.dart';

import '../../../shared/components.dart';
import '../../components/core_components/default_text_style.dart';
import '../../components/home_screen_components/card_item.dart';
import '../events_screen/events_screen.dart';
import '../finals_screen/finals_screen.dart';
import '../notes_screen/notes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List actions = [
      () {
        navigateTo(context, const LecturesScreen());
      },
      () {
        navigateTo(context, const SectionsScreen());
      },
      () {
        navigateTo(context, const MidtermsScreen());
      },
      () {
        navigateTo(context, const FinalsScreen());
      },
      () {
        navigateTo(context, const EventsScreen());
      },
      () {
        navigateTo(context, const NotesScreen());
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const CustomDefaultTextStyle(),
              Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 120,
                      ),
                      itemCount: cardLists.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: actions[index],
                          child: cardLists[index],
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
