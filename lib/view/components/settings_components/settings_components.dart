import 'package:flutter/material.dart';

Widget customDivider() {
  return const Divider(
    thickness: 1,
    endIndent: 25,
    indent: 20,
  );
}

Widget buildListTile(String title) {
  return ListTile(
    leading: Text(
      title,
      style: const TextStyle(
        fontSize: 25,
      ),
    ),
    trailing: const Icon(Icons.arrow_forward_ios),
  );
}