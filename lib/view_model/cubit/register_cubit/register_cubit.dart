import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/model/grade_model/grade_model.dart';
import 'package:odc_bootcamp/model/university_model/university_model.dart';
import 'package:odc_bootcamp/view_model/cubit/register_cubit/register_state.dart';
import 'package:odc_bootcamp/view_model/database/network/dio_helper.dart';
import 'package:odc_bootcamp/view_model/database/network/end_points.dart';

import '../../../model/register_model/register_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  IconData suffixIcon = Icons.visibility;
  bool isPasswordShown = true;

  void changePasswordIcon() {
    isPasswordShown = !isPasswordShown;
    suffixIcon = isPasswordShown ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordIconState());
  }

  String dropDownValueGender = 'Male';

  String dropDownValueUniversity = 'AUC';

  String dropDownValueGrade = 'Grade 1';

  // List of items in our dropdown menu
  List<String> itemsGender = ['Male', 'Female'];

  List<String> itemsUniversity = [
    'AUC',
    'Cairo',
    'ELU',
    'GUC',
    'Helwan',
    'HTI'
  ];

  List<String> itemsGrade = [
    'Admin',
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
    'Grade 5',
    'Teaching Staff'
  ];

  RegisterModel? registerModel;

  void register() {
    emit(RegisterLoading());
    DioHelper.postData(url: registerEndPoint, data: {
      'email': emailController.text,
      'password': passwordController.text,
      'name': nameController.text,
      'gender': 'm',
      'phoneNumber': phoneNumberController.text,
      'universityId': '1',
      'gradeId': '4',
      'roleId': '2',
    }).then((value) {
      if (value.data['code'] == "ValidationError") {
        print('1');
        emit(RegisterUserExisted());
      } else if (value.data['code'] == "Success") {
        print('2');
        registerModel = RegisterModel.fromJson(value.data);
        emit(RegisterSuccess());
      } else {
        print('3');
      }
    }).catchError((e) {
      print('4');
      print(e.toString());
      emit(RegisterError());
    });
  }
  void validateData() {
    if (formKey.currentState!.validate()) {
      register();
    }
  }

  GradeModel? gradeModel;

  void getGrade() {
    emit(GradeLoading());
    DioHelper.getData(url: gradeEndPoint, token: token).then((value) {
      gradeModel = GradeModel.fromJson(value.data);
      // gradeModel!.data!.map((e) => itemsGrade.add(e.grade!)).toList();
      print(itemsGrade);
      emit(GradeSuccess());
    }).catchError((e) {
      emit(GradeError());
    });
  }

  UniversityModel? universityModel;

  void getUniversity() {
    emit(UniversityLoading());
    DioHelper.getData(url: universityEndPoint, token: token).then((value) {
      universityModel = UniversityModel.fromJson(value.data);
      // universityModel!.data!.map((e) => itemsUniversity.add(e.name!)).toList();
      print(itemsUniversity);

      emit(UniversitySuccess());
    }).catchError((e) {
      emit(UniversityError());
    });
  }
}
