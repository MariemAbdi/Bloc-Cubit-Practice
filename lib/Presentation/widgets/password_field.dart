import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (password) {
          if (password!.isEmpty) {
            return "Password Can't Be Empty.";
          }
          ///Will be handled in bloc
          // else if (password.length < 6) {
          //   return "Password Should Contain At Least 6 Characters.";
          // }
        return null;
      },
      controller: widget.controller,
      obscureText: isPasswordVisible,
      obscuringCharacter: "*",
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Type Password",
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(isPasswordVisible
                ? Icons.visibility_off
                : Icons.visibility),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          )),
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}