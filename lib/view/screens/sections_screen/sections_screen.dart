import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/view_model/cubit/sections_cubit/section_cubit.dart';
import 'package:odc_bootcamp/view_model/cubit/sections_cubit/section_state.dart';

import '../../../core/resources/color_manager.dart';
import '../../components/core_components/custom_card.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SectionCubit, SectionState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.deepOrange,
            )),
        title: const Text(
          'Sections',
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
      body: ConditionalBuilder(
        condition: SectionCubit.get(context).sectionModel != null,
        builder: (context) {
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return buildCustomCardSectionItem(
                sectionData:
                SectionCubit.get(context).sectionModel!.data![index],
              );
            },
            itemCount: SectionCubit.get(context).sectionModel!.data!.length,
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
