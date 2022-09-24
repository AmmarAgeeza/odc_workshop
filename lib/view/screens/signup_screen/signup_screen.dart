import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_bootcamp/core/resources/strings_manager.dart';
import 'package:odc_bootcamp/shared/components.dart';
import 'package:odc_bootcamp/view/components/core_components/default_text_style.dart';
import 'package:odc_bootcamp/view/screens/login_screen/login_screen.dart';
import 'package:odc_bootcamp/view_model/cubit/register_cubit/register_cubit.dart';
import 'package:odc_bootcamp/view_model/cubit/register_cubit/register_state.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../components/core_components/custom_button.dart';
import '../../components/core_components/custom_text_form_field.dart';
import '../../components/core_components/divider_or_divider.dart';
import '../../components/sign_up_components/custom_drop_menu.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var valueDrop = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showTopSnackBar(
            context,
            const CustomSnackBar.success(
              message: "Registered Successfully",
            ),
          );
          navigateAndFinish(context, const LoginScreen());
        } else if (state is RegisterUserExisted) {
          showTopSnackBar(
            context,
            const CustomSnackBar.error(
              message: "User Existed Before",
            ),
          );
        } else if (state is RegisterError) {
          showTopSnackBar(
            context,
            const CustomSnackBar.error(
              message: "Enter Valid Data",
            ),
          );
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: RegisterCubit.get(context).itemsUniversity.isNotEmpty &&
              RegisterCubit.get(context).itemsGrade.isNotEmpty,
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: ColorManager.primary,
            ),
          ),
          builder: (context) => Scaffold(
            body: SafeArea(
              child: Center(
                child: Form(
                  key: RegisterCubit.get(context).formKey,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(15),
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomDefaultTextStyle(),
                      const SizedBox(
                        height: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            AppStrings.signUp,
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          defaultFormField(
                              label: AppStrings.name,
                              controller:
                                  RegisterCubit.get(context).nameController,
                              type: TextInputType.text,
                              validate: (val) {
                                if (val!.isEmpty) {
                                  return 'Please Enter Name';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          defaultFormField(
                              label: AppStrings.email,
                              controller:
                                  RegisterCubit.get(context).emailController,
                              type: TextInputType.emailAddress,
                              validate: (val) {
                                if (val!.isEmpty) {
                                  return 'Please Enter valid E-mail';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          defaultFormField(
                              label: AppStrings.password,
                              controller:
                                  RegisterCubit.get(context).passwordController,
                              type: TextInputType.visiblePassword,
                              isPassword:
                                  RegisterCubit.get(context).isPasswordShown,
                              suffix: RegisterCubit.get(context).suffixIcon,
                              suffixPressed: () {
                                RegisterCubit.get(context).changePasswordIcon();
                              },
                              validate: (val) {
                                if (val!.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              label: AppStrings.password,
                              controller:
                                  RegisterCubit.get(context).passwordController,
                              type: TextInputType.visiblePassword,
                              isPassword:
                                  RegisterCubit.get(context).isPasswordShown,
                              suffix: RegisterCubit.get(context).suffixIcon,
                              suffixPressed: () {
                                RegisterCubit.get(context).changePasswordIcon();
                              },
                              validate: (val) {
                                if (val!.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              label: AppStrings.phoneNumber,
                              controller: RegisterCubit.get(context)
                                  .phoneNumberController,
                              type: TextInputType.phone,
                              validate: (val) {
                                if (val!.isEmpty) {
                                  return 'Please Enter Phone Number';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              customDropMenu(
                                  function: (d) {
                                    RegisterCubit.get(context)
                                        .dropDownValueGender = d!;
                                  },
                                  dropDownValue: RegisterCubit.get(context)
                                      .dropDownValueGender,
                                  items: RegisterCubit.get(context)
                                      .itemsGender
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  title: 'Gender'),
                              customDropMenu(
                                  function: (d) {
                                    RegisterCubit.get(context)
                                        .dropDownValueUniversity = d!;
                                  },
                                  dropDownValue: RegisterCubit.get(context)
                                      .dropDownValueUniversity,
                                  items: RegisterCubit.get(context)
                                      .itemsUniversity
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  title: 'University'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: customDropMenu(
                              function: (d) {
                                RegisterCubit.get(context).dropDownValueGrade =
                                    d!;
                              },
                              title: 'Grade',
                              dropDownValue:
                                  RegisterCubit.get(context).dropDownValueGrade,
                              items: RegisterCubit.get(context)
                                  .itemsGrade
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ConditionalBuilder(
                            condition: state is! RegisterLoading,
                            builder: (context) => defaultButton(
                              function: () {
                                RegisterCubit.get(context).validateData();
                              },
                              text: AppStrings.signUp,
                              backgroundColor: ColorManager.primary,
                              textColor: ColorManager.white,
                            ),
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
                              navigateTo(context, const LoginScreen());
                            },
                            text: AppStrings.login,
                            textColor: ColorManager.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
