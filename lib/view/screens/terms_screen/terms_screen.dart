import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/core/resources/color_manager.dart';
import 'package:odc_bootcamp/view_model/cubit/note_cubit/note_cubit.dart';
import 'package:odc_bootcamp/view_model/cubit/note_cubit/note_state.dart';
import 'package:odc_bootcamp/view_model/cubit/terms_cubit/terms_state.dart';

import '../../../view_model/cubit/terms_cubit/terms_cubit.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TermsCubit, TermsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
              'Terms & Conditions',
              style: TextStyle(color: Colors.black),
            ),
          ),

          body: ConditionalBuilder(
            condition: TermsCubit.get(context).termsModel != null,
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            ),
            builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(text: TermsCubit.get(context).convertText(context))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
