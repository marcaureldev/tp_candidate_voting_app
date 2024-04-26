import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

 ButtonForm({super.key, required this.text,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColorDark,
        foregroundColor: Colors.white,
      ),
        onPressed: onPressed,
        child:Text(
          "$text".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )
    );
  }
}
