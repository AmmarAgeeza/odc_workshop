
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/model/terms_model/terms_model.dart';
import 'package:odc_bootcamp/view_model/cubit/terms_cubit/terms_state.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());
 static TermsCubit get(context)=> BlocProvider.of(context);
  TermsModel? termsModel;

  void getLectures() {
    print(1);
    emit(TermsLoading());
    DioHelper.getData(url: termsEndPoint,token: token).then((value) {
      termsModel=TermsModel.fromJson(value.data);
      print(termsModel!.data!.terms);
      emit(TermsSuccess());
    }).catchError((e){
      emit(TermsError());
    });
  }
  convertText(context){
    final TextSpan textSpan = HTML.toTextSpan(
      context,
      '''${termsModel!.data!.terms}''',
      linksCallback: (dynamic link) {
        debugPrint('You clicked on ${link.toString()}');
      },
      defaultTextStyle: TextStyle(color: Colors.grey[700]),
      overrideStyle: <String, TextStyle>{
        'p': const TextStyle(fontSize: 17.3),
        'a': const TextStyle(wordSpacing: 2),

      },
    );
    emit(TermsConvertedText());
    return textSpan;
  }
}
