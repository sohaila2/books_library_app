import 'package:books_library_app/views/book_details_view.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/book_model/book_model.dart';
import '../book_details/custom_gradient_button.dart';
import '../custom_book_image.dart';

class CurrentReadingItem extends StatelessWidget {
  const CurrentReadingItem({
    super.key, required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BookDetailsView.id,arguments: bookModel);
      },
      child: SizedBox(
        height: 160,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '', width: 122, height: 171,),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: kPrimaryColor,
                      ),),
                    Text(bookModel.volumeInfo.authors?.isNotEmpty == true
                        ? bookModel.volumeInfo.authors![0]
                        : '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: kPrimaryColor,
                      ),),
                    Text("152 of 310 pages",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: kPrimaryColor,
                      ),),
                       SizedBox(
                         height: 6,
                       ),
                       Center(
                           child: CustomGradientButton(bookModel: bookModel, width: 125, text: 'Read',)
                       ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
