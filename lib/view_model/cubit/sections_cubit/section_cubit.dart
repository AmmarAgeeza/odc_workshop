
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/view_model/cubit/sections_cubit/section_state.dart';

import '../../../model/section_model/section_model.dart';

import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionCubit() : super(SectionInitial());
  static SectionCubit get(context) => BlocProvider.of(context);
  SectionModel? sectionModel;

  void getSections() {
    print(1);
    emit(SectionLoading());
    DioHelper.getData(url: sectionEndPoint,token: token).then((value) {
      sectionModel=SectionModel.fromJson(value.data);
      print(sectionModel!.message);
      emit(SectionSuccess());
    }).catchError((e){
      emit(SectionError());
    });
  }
}
