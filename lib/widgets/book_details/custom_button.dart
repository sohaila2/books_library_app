import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.icon, required this.text, required this.onPress});

  final Icon icon;
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed:
          onPress,
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff0047AB),
              onPrimary: Colors.white,
             shape: CircleBorder(),
            ),child: Container(
                width: 48.0, // Adjust width to increase button size
                height: 48.0,
                child: icon)),
        SizedBox(height:
          4,),
        Text(text,
        style: TextStyle(
          color: Color(0xff0047AB)
        ),),
      ],
    );
  }
}
