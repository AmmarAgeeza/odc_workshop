import 'package:flutter/material.dart';

TextButton buildTextButton() {
  return TextButton(
      onPressed: () {},
      child: const Text(
        'Forget Password?',
        style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 20,
            decoration: TextDecoration.underline,
            // decorationColor:
            decorationThickness: 1.5),
      ));
}