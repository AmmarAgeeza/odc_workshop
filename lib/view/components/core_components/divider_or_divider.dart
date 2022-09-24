import 'package:flutter/material.dart';

import '../../../core/resources/values_manager.dart';

Container dividerOrDivider() {
  return Container(
    margin: const EdgeInsets.all(AppMargin.m10),
    height: 45,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Expanded(
          child: Divider(
            color: Colors.black,
          ),
        ),
        Text(
          '   OR   ',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}