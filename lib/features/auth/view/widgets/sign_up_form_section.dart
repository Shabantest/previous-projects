import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner360/features/auth/view_model/user_cubit.dart';
import 'package:trip_planner360/features/auth/view_model/user_states.dart';

import '../../../../core/utils/custom_text_form_field.dart';
class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserStates>(
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return " you must enter your name!";
                  }
                  return null;
                },
                hintText: 'Enter your name',
                controller: cubit.userNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return " you must enter your last name!";
                  }
                  return null;
                },
                hintText: 'Last name',
                controller: cubit.lastNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return " you must enter your email!";
                  }
                  return null;
                },
                hintText: 'Email',
                controller: cubit.emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return "please Enter Your Password !";
                  } else if ((value?.length ?? 0) < 8) {
                    return "password Cant To Be Less Than 8 characters!";
                  } else if (!RegExp(r'[A-Z]').hasMatch(value ?? '')) {
                    return "Password Must Contain At Least One Capital Letter!";
                  } else if (!RegExp(r'[0-9]').hasMatch(value ?? '')) {
                    return "Password Must Contain At Least One Number!";
                  } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value ?? '')) {
                    return "Password Must Contain At Least One symbol! ";
                  }
                  return null;
                },
                hintText: 'Password',
                controller: cubit.passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if ((value ?? '')!=cubit.passwordController.text) {
                    return " you must enter the same password!";
                  }
                  return null;
                },
                hintText: 'Confirm Password',
                controller: cubit.confirmPasswordController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return " you must enter your gender !";
                  }
                  return null;
                },
                hintText: 'gender',
                controller: cubit.genderController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(

                hintText: 'date of birth',
                controller: cubit.dateOfBrithController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: 'Nationality',
                controller: cubit.nationalityController,
              ),
            ],
          ),
        );
      },
    );
  }
}
