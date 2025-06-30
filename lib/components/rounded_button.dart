import 'package:flutter/material.dart';

class roundButton extends StatelessWidget {
  final Color colourr;
  final String title;
  final VoidCallback onpress;

  const roundButton({
    super.key,
    required this.colourr,
    required this.title,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colourr,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(title, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
