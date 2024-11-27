import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (email) {
        if (email!.isEmpty) {
          return "Email Can't Be Empty.";
        }
        ///This will be checked in bloc
        // else if (!RegExp(r"^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+").hasMatch(email)) {
        //   return "Email Format Is Invalid.";
        // }
        return null;
      },
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "anonymous@email.com",
          prefixIcon: const Icon(Icons.email),
          suffixIcon: widget.controller.text.isEmpty
              ? null
              : IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                widget.controller.clear();
              });
            },
          )),
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}