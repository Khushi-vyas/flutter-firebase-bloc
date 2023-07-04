import 'package:demo/repositories/auth_repository.dart';
import 'package:demo/screens/signup/signup_screen.dart';
import 'package:demo/themes/app.theme.dart';
import 'package:demo/utils/constants/app.dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
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
            BlocProvider(
              create: (context) => LoginCubit(context.read<AuthRepository>()),
              child: const LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(AppDimension.kPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hi!",
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
              child: BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.status == LoginStatus.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height - 120,
                            right: 20,
                            left: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppDimension.kRadius)),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red.shade300,
                        padding: const EdgeInsets.all(AppDimension.kPadding),
                        content: Text(
                          state.errorMessage ?? 'Authentication Failure',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  } else if (state.status == LoginStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        // margin: EdgeInsets.only(
                        //     bottom: MediaQuery.of(context).size.height - 120,
                        //     right: 20,
                        //     left: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppDimension.kRadius)),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppTheme.themeSuccessColor,
                        padding: const EdgeInsets.all(AppDimension.kPadding),
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
                    _LoginButton(),
                    SizedBox(
                      height: AppDimension.kPadding,
                    ),
                    Text(
                      "or",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: AppDimension.kPadding,
                    ),
                    _LoginWithGoogleButton(),
                    SizedBox(
                      height: AppDimension.kPadding,
                    ),
                    _SignupButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
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
            context.read<LoginCubit>().emailChanged(val);
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          textInputAction: TextInputAction.done,
          obscureText: true,
          //keyboardType: TextInputType.emailAddress,
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
            context.read<LoginCubit>().passwordChanged(val);
          },
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().loginWithCredentials();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55)),
                child: const Text(
                  "Login",
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

class _SignupButton extends StatelessWidget {
  const _SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?  "),
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const SignupScreen();
            }));
          },
          child: const Text(
            "Signup",
            //  style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _LoginWithGoogleButton extends StatelessWidget {
  const _LoginWithGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      label: const Text(
        "Sign in with Google",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimension.kRadius),
          ),
          backgroundColor: Colors.blueGrey.shade100),
      icon: SvgPicture.asset("assets/google-icon.svg"),
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
    );
  }
}
