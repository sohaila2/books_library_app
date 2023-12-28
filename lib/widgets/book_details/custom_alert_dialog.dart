

import 'package:books_library_app/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class CustomAlertDailog extends StatelessWidget {
  const CustomAlertDailog({
    super.key, required this.title, required this.firstButton, required this.icon, required this.navigateTap, required this.confirmTap,
  });

final VoidCallback navigateTap;
  final VoidCallback confirmTap;

  final String title;
  final String firstButton;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff6495ED),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 48.0,
            color: Colors.white,
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 112,
                height: 56,
                child: TextButton(
                    onPressed: navigateTap,
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff0047AB),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Text(
                      firstButton,
                      style:
                      TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                width: 112,
                height: 56,
                child: TextButton(
                    onPressed: confirmTap,
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff0047AB),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Text(
                      'Okay',
                      style:
                      TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
