import 'package:first/db/preferences_service.dart';
import 'package:first/pages/signin.dart';
import 'package:first/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:first/pages/profile.dart';
import 'package:get_it/get_it.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/sign-in': (BuildContext context) =>
        Signin(GetIt.instance.get<PreferencesService>()),
    '/': (BuildContext context) =>
        SignUp(GetIt.instance.get<PreferencesService>()),
    '/forgot-password': (BuildContext context) => const SizedBox(),
    '/profile': (BuildContext context) =>
        Profile(GetIt.instance.get<PreferencesService>())
  };
}
