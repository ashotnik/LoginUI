// ignore_for_file: use_build_context_synchronously
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import 'package:first/button_widget.dart';
import 'package:first/db/preferences_service.dart';
import 'package:first/pages/signin.dart';
import 'package:first/textformfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp(this.preferencesService, {super.key});

  final PreferencesService preferencesService;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              const Image(
                image: AssetImage("assets/signup_picture.png"),
                width: 138,
                height: 141,
              ),
              const SizedBox(height: 30),
              TextFieldWidget(
                controller: _usernameController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please fill the field";
                  }
                  return null;
                },
                hintText: "Username",
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                  hintText: "Enter email",
                  controller: _emailController,
                  validator: (String? value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value)) {
                      return "Please enter valid email";
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: _phoneNumberController,
                validator: (String? value) {
                  if (!RegExp(r'^\+[0-9]+$').hasMatch(value!)) {
                    return "Please enter valid Phone Number";
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                hintText: "Phone number",
                inputFormatters: [MaskedInputFormatter('+###########')],
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: _pass,
                validator: (String? value) {
                  if (value!.isEmpty || value.length <= 8) {
                    return "Please enter more 8 character";
                  }
                  return null;
                },
                obscureText: true,
                hintText: "Enter password",
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                validator: (String? value) {
                  if (value != _pass.text) {
                    return "Password do not match";
                  }
                  return null;
                },
                hintText: "Confirm password",
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ButtonWidget(
                text: "Sign up",
                onTap: _signUp,
              ),
              const SizedBox(height: 20),
              const Text("or",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 20,
              ),
              const social(),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sign-in');
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          color: Color.fromARGB(130, 177, 1, 1),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(130, 177, 1, 1)),
                    ))
              ])
            ],
          )),
        ));
  }

  Future<void> _signUp() async {
    try {
      await widget.preferencesService.setEmail(_emailController.text);
      await widget.preferencesService.setPassword(_pass.text);
      await widget.preferencesService.setUsername(_usernameController.text);
      await widget.preferencesService
          .setphoneNumber(_phoneNumberController.text);
      Navigator.of(context).pushNamed('/profile');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
