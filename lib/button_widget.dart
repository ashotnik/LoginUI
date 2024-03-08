import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({required this.text, this.onTap, super.key});

  final void Function()? onTap;

  // final GlobalKey<FormState> _globalKey;
  final String text;
  // final GlobalKey<FormState> _globalKey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(120, 10, 120, 10),
        decoration: const BoxDecoration(color: Color(0xFF20C3AF)),
        child: Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
      ),
    );
  }
}
