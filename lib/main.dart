import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/core/routes.dart';
import 'package:odc_bootcamp/view_model/cubit/exam_cubit/exam_cubit.dart';
import 'package:odc_bootcamp/view_model/cubit/home_layout_cubit/home_layout_cubit.dart';
import 'package:odc_bootcamp/view_model/cubit/lecture_cubit/lecture_cubit.dart';
import 'package:odc_bootcamp/view_model/cubit/note_cubit/note_cubit.dart';
import 'package:odc_bootcamp/view_model/cubit/register_cubit/register_cubit.dart';
import 'package:odc_bootcamp/view_model/cubit/sections_cubit/section_cubit.dart';
import 'package:odc_bootcamp/view_model/cubit/terms_cubit/terms_cubit.dart';
import 'package:odc_bootcamp/view_model/database/network/dio_helper.dart';

import 'core/resources/color_manager.dart';
import 'view_model/cubit/login_cubit/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LectureCubit()),
        BlocProvider(create: (context) => HomeLayoutCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(
            create: (context) => RegisterCubit()
              ..getGrade()
              ..getUniversity()),
        BlocProvider(create: (context) => LectureCubit()..getLectures()),
        BlocProvider(create: (context) => SectionCubit()..getSections()),
        BlocProvider(create: (context) => ExamCubit()..getExams()),
        BlocProvider(create: (context) => NoteCubit()..createDatabase()),
        BlocProvider(create: (context) => TermsCubit()..getLectures()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: ColorManager.primary,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RoutesGenerator.getRoute,
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// List<Widget> widgets = [
//   Text('data'),
//   ElevatedButton(onPressed: add, child: Text(''))
// ];
// void add(){
//   widgets.add(Text(''));
// }
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//           children:[
//             ListTile(
//               title: Flutter,
//             )
//           ]
//       ),
//     );
//   }
// }
