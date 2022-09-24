import 'package:flutter/material.dart';

import '../../components/core_components/default_text_style.dart';

class PartnerScreen extends StatelessWidget {
  const PartnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.deepOrange,
            )),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Our Partners',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
              ),
              Positioned(
                top: 75,
                bottom: 75,
                right: MediaQuery.of(context).size.width * 0.05,
                left: MediaQuery.of(context).size.width * 0.05,
                child: const CustomDefaultTextStyle(),
              ),
              const Positioned(
                  top: 20,
                  left: 25,
                  child: Text(
                    'OSC',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25),
                  )),


            ],
          ),
        ],
      ),
    );
  }
}
