import 'package:first/db/preferences_service.dart';
import 'package:flutter/material.dart';
import '../button_widget.dart';
import '../textformfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signin extends StatefulWidget {
  const Signin(this.preferencesService, {super.key});

  final PreferencesService preferencesService;

  @override
  State<Signin> createState() => _MyAppState();
}

class _MyAppState extends State<Signin> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign in',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          key: _globalKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30.0),
                const Image(
                  image: AssetImage("assets/signin_picture.png"),
                  height: 145,
                  width: 100,
                ),
                const SizedBox(height: 30.0),
                TextFieldWidget(
                  controller: _usernameController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Please enter username";
                    }
                    return null;
                  },
                  hintText: "Username",
                ),
                const SizedBox(height: 20.0),
                TextFieldWidget(
                  controller: _passwordController,
                  validator: (String? value) {
                    if (value!.isEmpty || value.length <= 8) {
                      return "Please enter more 8 character";
                    }
                    return null;
                  },
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/forgot-password');
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 20.0),
                ButtonWidget(
                  text: "Login",
                  onTap: _signIn,
                ),
                const SizedBox(height: 20.0),
                const Text('or',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 40.0),
                const social(),
                const SizedBox(height: 20.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Color.fromARGB(130, 177, 1, 1),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(130, 177, 1, 1)),
                    ),
                  )
                ])
              ],
            ),
          ),
        ));
  }

  void _signIn() {
    final String? username = widget.preferencesService.getUsername();
    final String? password = widget.preferencesService.getPassword();
    if (username == _usernameController.text &&
        password == _passwordController.text) {
      Navigator.of(context).pushNamed('/profile');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid credentials')));
    }
  }
}

// ignore: camel_case_types
class social extends StatefulWidget {
  const social({super.key});

  @override
  State<social> createState() => _socialState();
}

// ignore: camel_case_types
class _socialState extends State<social> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {},
              child: SvgPicture.asset(
                "assets/fb.svg",
                width: 27,
                height: 27,
              )),
          const SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {},
              child: SvgPicture.asset(
                "assets/twt.svg",
                width: 27,
                height: 27,
              )),
          const SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {},
              child: SvgPicture.asset(
                "assets/ln.svg",
                width: 27,
                height: 27,
              )),
        ],
      ),
    );
  }
}
