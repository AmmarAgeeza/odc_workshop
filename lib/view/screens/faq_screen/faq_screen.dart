import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          'FAQ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ExpansionTile(
              textColor: ColorManager.white,
              collapsedTextColor: ColorManager.white,
              collapsedBackgroundColor: ColorManager.primary,
              backgroundColor: ColorManager.primary,
              title: Text(
                'Q1: How many countries Orange Digital Center is in ? ',
                style: TextStyle(color: ColorManager.white),
              ),
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                    width: double.infinity,
                    height: 50,
                    child: const Center(child: Text('16 Country'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
