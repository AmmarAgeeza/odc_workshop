import 'package:flutter/material.dart';
import 'package:odc_bootcamp/core/resources/color_manager.dart';
import 'package:odc_bootcamp/shared/components.dart';
import 'package:odc_bootcamp/view/components/core_components/default_text_style.dart';
import 'package:odc_bootcamp/view/screens/login_screen/login_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomDefaultTextStyle(),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              barRadius: const Radius.circular(15),
              alignment: MainAxisAlignment.center,
              lineHeight: 10.0,
              animationDuration: 200,
              percent: 1,
              onAnimationEnd: (){
                navigateAndFinish(context, const LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
