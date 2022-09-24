import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_bootcamp/core/resources/color_manager.dart';
import 'package:odc_bootcamp/shared/components.dart';

import '../../../core/resources/assets_manager.dart';
import '../../screens/lectures_screen/lectures_screen.dart';

Widget buildCard({
  required String path,
  required String title,
  required Function() function,
}) {
  return Card(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            path,
            height: 60,
            width: 60,
            color: ColorManager.primary,
          ),
          Text(title)
        ],
      ),
    ),
  );
}

List cardLists = [
  buildCard(path: ImageAssets.lectureIcon, title: 'Lectures', function: () {}),
  buildCard(path: ImageAssets.sectionsIcon, title: 'Sections', function: () {}),
  buildCard(path: ImageAssets.midtermIcon, title: 'Midterms', function: () {}),
  buildCard(path: ImageAssets.finalIcon, title: 'Finals', function: () {}),
  buildCard(path: ImageAssets.eventIcon, title: 'Events', function: () {}),
  buildCard(path: ImageAssets.notesIcon, title: 'Notes', function: () {}),
];
