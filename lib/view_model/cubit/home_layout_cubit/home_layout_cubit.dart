import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/screens/home_screen/home_screen.dart';
import '../../../view/screens/news_screen/news_screen.dart';
import '../../../view/screens/settings_screen/settings_screen.dart';
import 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const NewsScreen(),
    const SettingsScreen(),
  ];
  void changeIndex(int index){
    currentIndex=index;
    emit(ChangeNavBarState());
  }
}
