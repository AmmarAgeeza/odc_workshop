import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/view_model/cubit/exam_cubit/exam_cubit.dart';
import 'package:odc_bootcamp/view_model/cubit/exam_cubit/exam_state.dart';

import '../../../core/resources/color_manager.dart';
import '../../components/core_components/custom_card.dart';

class MidtermsScreen extends StatelessWidget {
  const MidtermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamCubit, ExamState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                  color: Colors.deepOrange,
                )),
            title: const Text(
              'Midterms',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            centerTitle: true,
            actions: const [
              Icon(
                Icons.filter_alt,
                color: Colors.deepOrange,
                size: 35,
              ),
            ],
          ),
          body:ConditionalBuilder(
            condition: ExamCubit.get(context).examModel != null,
            builder: (context) {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return buildCustomCardExamItem(
                   examData:
                    ExamCubit.get(context).midTermExams![index],
                  );
                },
                itemCount: ExamCubit.get(context).midTermExams!.length,
              );
            },
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
