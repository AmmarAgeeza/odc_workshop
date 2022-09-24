import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/exam_mode/exam_model.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit() : super(ExamInitial());

  static ExamCubit get(context) => BlocProvider.of(context);
  ExamModel? examModel;
  List<ExamData>? midTermExams;
  List<ExamData>? finalExams;

  void getExams() {
    print(1);
    emit(ExamLoading());
    DioHelper.getData(url: examsEndPoint, token: token).then((value) {
      examModel = ExamModel.fromJson(value.data);
      midTermExams = examModel!.data!
          .where((element) => element.finalExam == false)
          .toList();
      finalExams = examModel!.data!
          .where((element) => element.finalExam == true)
          .toList();

      emit(ExamSuccess());
    }).catchError((e) {
      emit(ExamError());
    });
  }
}
