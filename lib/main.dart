import 'package:demo/repositories/auth_repository.dart';
import 'package:demo/screens/app/app_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//  Bloc.observer = AppBlocObserver();
  final AuthRepository authRepository = AuthRepository();
  runApp(App(authRepository: authRepository));
}
