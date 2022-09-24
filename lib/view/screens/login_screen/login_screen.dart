import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/core/resources/color_manager.dart';
import 'package:odc_bootcamp/core/resources/strings_manager.dart';
import 'package:odc_bootcamp/core/resources/values_manager.dart';
import 'package:odc_bootcamp/shared/components.dart';
import 'package:odc_bootcamp/view/screens/signup_screen/signup_screen.dart';
import 'package:odc_bootcamp/view_model/cubit/login_cubit/login_state.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/resources/fonts_manager.dart';
import '../../../view_model/cubit/login_cubit/login_cubit.dart';
import '../../components/core_components/custom_button.dart';
import '../../components/core_components/custom_text_button.dart';
import '../../components/core_components/custom_text_form_field.dart';
import '../../components/core_components/default_text_style.dart';
import '../../components/core_components/divider_or_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccess){
          showTopSnackBar(
            context,
            const CustomSnackBar.success(
              message:
              "Login Successfully",
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Form(
                key: LoginCubit.get(context).formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(AppPadding.p16),
                  children: [
                    const SizedBox(height: AppSize.s16),
                    const CustomDefaultTextStyle(),
                    const SizedBox(
                      height: AppSize.s80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.login,
                          style: AppTextStyles.heading(),
                        ),
                        const SizedBox(height: AppSize.s25),
                        defaultFormField(
                            controller: LoginCubit.get(context).emailController,
                            label: AppStrings.email,
                            type: TextInputType.emailAddress,
                            validate: (val) {
                              if (val!.isEmpty) {
                                return 'Please Enter E-mail';
                              }
                              return null;
                            }),
                        const SizedBox(height: AppSize.s25),
                        defaultFormField(
                            controller:
                                LoginCubit.get(context).passwordController,
                            label: AppStrings.password,
                            type: TextInputType.visiblePassword,
                            isPassword: LoginCubit.get(context).isPasswordShown,
                            suffix: LoginCubit.get(context).suffixIcon,
                            suffixPressed: () {
                              LoginCubit.get(context).changePasswordIcon();
                            },
                            validate: (val) {
                              if (val!.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            }),
                        const SizedBox(height: AppSize.s15),
                        buildTextButton(),
                        const SizedBox(
                          height: AppSize.s25,
                        ),
                        ConditionalBuilder(
                          builder: (context) => defaultButton(
                            function: () {
                              print(LoginCubit.get(context)
                                  .passwordController
                                  .text);
                              print(
                                  LoginCubit.get(context).emailController.text);
                              LoginCubit.get(context).validateData(context);
                            },
                            text: AppStrings.login,
                            backgroundColor: ColorManager.primary,
                            textColor: ColorManager.white,
                          ),
                          condition: state is! LoginLoading,
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s15,
                        ),
                        dividerOrDivider(),
                        const SizedBox(
                          height: AppSize.s15,
                        ),
                        defaultButton(
                          function: () {
                            navigateTo(context, SignUpScreen());
                          },
                          text: AppStrings.signUp,
                          textColor: ColorManager.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
