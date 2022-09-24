import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/model/lecture_model/lecture_model.dart';

import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit() : super(LectureInitial());

  static LectureCubit get(context) => BlocProvider.of(context);
  LectureModel? lectureModel;

  void getLectures() {
    print(1);
    emit(LectureLoading());
    DioHelper.getData(url: lectureEndPoint,token: token).then((value) {
      lectureModel=LectureModel.fromJson(value.data);
      print(lectureModel!.message);
      emit(LectureSuccess());
    }).catchError((e){
      emit(LectureError());
    });
  }
}
