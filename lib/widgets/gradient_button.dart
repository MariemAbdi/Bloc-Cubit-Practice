import 'package:flutter/material.dart';
class GradientButton extends StatelessWidget {
  const GradientButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 395,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(187, 63, 221, 1),
            Color.fromRGBO(251, 109, 169, 1),
            Color.fromRGBO(255, 159, 124, 1),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}