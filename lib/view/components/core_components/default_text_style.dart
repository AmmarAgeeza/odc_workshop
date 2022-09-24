import 'package:flutter/material.dart';
import 'package:odc_bootcamp/core/resources/color_manager.dart';

import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/strings_manager.dart';

class CustomDefaultTextStyle extends StatelessWidget {
  const CustomDefaultTextStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: AppTextStyles.heading(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${AppStrings.orange} ',
              style: TextStyle(
                color: ColorManager.primary,
              ),
            ),
            const Text(AppStrings.digitalCenter),
          ],
        ));
  }
}
