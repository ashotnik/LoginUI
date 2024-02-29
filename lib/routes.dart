import 'package:first/pages/signin.dart';
import 'package:first/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:first/pages/profile.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext context) => const Signin(),
    '/sign-up': (BuildContext context) => const SignUp(),
    '/forgot-password': (BuildContext context) => const SizedBox(),
    '/profile': (BuildContext context) => const Profile()
  };
}
