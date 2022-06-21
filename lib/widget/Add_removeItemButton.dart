import 'package:flutter/material.dart';

class Add_removeItemButton extends StatelessWidget {
  final IconData icon;
  final Function()? press;
  const Add_removeItemButton({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 30,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
