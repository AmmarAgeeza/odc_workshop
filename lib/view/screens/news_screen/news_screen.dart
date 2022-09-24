import 'package:flutter/material.dart';

import '../../components/core_components/default_text_style.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'News',
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
                    'OSCs',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25),
                  )),
              const Positioned(
                  bottom: 20,
                  left: 25,
                  child: Text(
                    'ODC Supports All Universities',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22),
                  )),
              Positioned(
                right: 25,
                top: 20,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      Text(
                        '  |  ',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Icon(
                        Icons.copy,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
