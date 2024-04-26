import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputForm extends StatelessWidget {
  String? name;
  Widget? prefixIcon;
  Widget? suffixIcon;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;

  InputForm(
      {super.key,
      this.name,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.validator,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          label: Text("$name"),
          hintText: '$name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          // prefix: Icon(Icons.person),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: Colors.green.shade50,
          filled: true),
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
