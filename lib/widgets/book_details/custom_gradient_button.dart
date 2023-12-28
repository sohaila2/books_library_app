

import 'package:books_library_app/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../launch_url.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key, required this.bookModel, required this.width, required this.text,

  });
final BookModel bookModel;
final double width;
final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0047AB),
            Color(0xffc6c7f5),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.1, 0.7],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: TextButton(
          onPressed: () {
            launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
          },
          //bookModel.accessInfo?.webReaderLink ??''
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

