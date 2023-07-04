import 'package:demo/screens/home/home_screen.dart';
import 'package:demo/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../screens/app/bloc/app_bloc.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
      break;
  }
}
