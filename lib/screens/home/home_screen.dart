import 'package:demo/themes/app.theme.dart';
import 'package:demo/utils/constants/app.dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/bloc/app_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.grey,
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            CircleAvatar(
              radius: 63,
              backgroundColor: AppTheme.themeColor,
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    user.photo == null ? null : NetworkImage(user.photo!),
                child: user.photo == null ? const Icon(Icons.person) : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimension.kPadding),
              child: Text(user.name ?? "Name"),
            ),
            Text(user.email ?? "Email"),
            const Spacer(
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimension.kPadding),
              child: ElevatedButton.icon(
                //  key: const Key('loginForm_googleLogin_raisedButton'),
                label: const Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimension.kRadius),
                    ),
                    backgroundColor: Colors.blueGrey.shade100),
                icon: const Icon(Icons.exit_to_app),
                onPressed: () =>
                    context.read<AppBloc>().add(const AppLogoutRequested()),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
