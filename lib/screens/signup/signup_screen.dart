import 'package:demo/repositories/auth_repository.dart';
import 'package:demo/utils/constants/app.dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../themes/app.theme.dart';
import 'cubit/signup_cubit.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SignupScreen());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocProvider(
            create: (context) => SignupCubit(context.read<AuthRepository>()),
            child: const SignupForm(),
          )),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: Align(
            alignment: Alignment.topRight,
            child: SimpleShadow(
              color: Colors.white,
              offset: const Offset(20, 20),
              sigma: 10,
              opacity: 0.4,
              child: SvgPicture.asset(
                "assets/Mediamodifier-Design.svg",
                alignment: Alignment.topRight,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimension.kPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign up",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36),
              ),
              const SizedBox(
                height: AppDimension.kPadding,
              ),
              GlassmorphicContainer(
                width: size.width,
                height: 470,
                borderRadius: AppDimension.kRadius,
                linearGradient: LinearGradient(colors: [
                  Colors.grey.withOpacity(0.3),
                  Colors.grey.withOpacity(0.7)
                ]),
                border: 0,
                blur: 10,
                borderGradient: const LinearGradient(
                    colors: [Colors.transparent, Colors.transparent]),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimension.kPadding),
                  child: BlocListener<SignupCubit, SignupState>(
                    listener: (context, state) {
                      if (state.status == SignupStatus.error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height - 120,
                                right: 20,
                                left: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppDimension.kRadius)),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red.shade300,
                            padding:
                                const EdgeInsets.all(AppDimension.kPadding),
                            content: Text(
                              state.errorMessage ?? 'Authentication Failure',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      } else if (state.status == SignupStatus.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            // margin: EdgeInsets.only(
                            //     bottom: MediaQuery.of(context).size.height - 120,
                            //     right: 20,
                            //     left: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppDimension.kRadius)),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: AppTheme.themeSuccessColor,
                            padding:
                                const EdgeInsets.all(AppDimension.kPadding),
                            content: const Text(
                              "Login Successful!",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: AppDimension.kPadding,
                        ),
                        _EmailInput(),
                        SizedBox(
                          height: AppDimension.kPadding,
                        ),
                        _PasswordInput(),
                        SizedBox(
                          height: AppDimension.kPadding * 2,
                        ),
                        _SignupButton(),
                        SizedBox(
                          height: AppDimension.kPadding,
                        ),
                        _LoginButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimension.kRadius)),
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: "Email",
            errorText: state.isValid ? null : "Enter correct email!",
          ),
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (val) {
            context.read<SignupCubit>().emailChanged(val);
          },
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          textInputAction: TextInputAction.done,

          style: const TextStyle(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimension.kRadius)),
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: "Password",

            // errorText: state.isValid ? null : "Enter correct email!",
          ),
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (val) {
            context.read<SignupCubit>().passwordChanged(val);
          },
        );
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  const _SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == SignupStatus.submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<SignupCubit>().signupFormSubmitted();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55)),
                child: const Text(
                  "Signup",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?  "),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Login",
            //  style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
