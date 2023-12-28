import 'package:books_library_app/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '', width: 280, height: 364),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(bookModel.volumeInfo.title!,
              style: TextStyle(
                  color: Color(0xff0047AB),
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(bookModel.volumeInfo.authors?.isNotEmpty == true
                ? bookModel.volumeInfo.authors![0]
                : '',
              style: TextStyle(
                  color: Color(0xff0047AB),
                  fontSize: 18,
                  fontWeight: FontWeight.w400
              ),),
          ),
        ],
      ),
    );
  }
}

