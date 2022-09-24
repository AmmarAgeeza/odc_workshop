import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/resources/color_manager.dart';
import '../../components/core_components/custom_button.dart';
import '../../components/core_components/custom_text_form_field.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.deepOrange,
        ),
        centerTitle: true,
        title: const Text(
          'Support',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              defaultFormField(
                label: 'Name',
                controller: emailController,
                type: TextInputType.emailAddress,
                prefix: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              defaultFormField(
                label: 'Email',
                controller: emailController,
                type: TextInputType.emailAddress,
                prefix: Icons.email_outlined,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'What\'s making your un happy?',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              defaultButton(
                  function: () {},
                  text: 'Submit',
                  textColor: ColorManager.white,
                  backgroundColor: ColorManager.primary)
            ],
          ),
        ),
      ),
    );
  }
}
