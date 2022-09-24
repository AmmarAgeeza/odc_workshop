import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:odc_bootcamp/core/resources/color_manager.dart';
import 'package:odc_bootcamp/view_model/cubit/home_layout_cubit/home_layout_state.dart';

import '../../../view_model/cubit/home_layout_cubit/home_layout_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: HomeLayoutCubit.get(context)
              .screens[HomeLayoutCubit.get(context).currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GNav(
              activeColor: ColorManager.primary,
              rippleColor: Colors.black12,
              selectedIndex: HomeLayoutCubit.get(context).currentIndex,
              onTabChange: (index) {
                HomeLayoutCubit.get(context).changeIndex(index);
              },
              gap: 8,
              tabBackgroundColor: Colors.black12,
              tabBorderRadius: 35,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.newspaper_outlined,
                  text: 'News',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
