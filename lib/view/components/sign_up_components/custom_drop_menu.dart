import 'package:flutter/material.dart';

Column customDropMenu(
    {required String title,
    required String dropDownValue,
required Function(String?) function,
    required List<DropdownMenuItem<String>>? items}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      const SizedBox(
        height: 15,
      ),
      Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange),
            borderRadius: BorderRadius.circular(15)),
        child: DropdownButton(
            underline: Container(),
            value: dropDownValue,
            borderRadius: BorderRadius.circular(10),
            // dropdownColor: Colors.deepOrange,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items,
            onChanged: function,
      ),),
    ],
  );
}
