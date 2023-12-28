import 'package:books_library_app/widgets/custom_book_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../models/book_model/book_model.dart';
import '../../views/book_details_view.dart';

class NewReleasesItem extends StatelessWidget {
   NewReleasesItem({super.key, required this.bookModel});
 final BookModel bookModel;
  @override
  Widget build(BuildContext context){
   return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BookDetailsView.id,arguments: bookModel);
      },
      child:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          width: 117,
          height: 163,
          fit: BoxFit.fill,
          errorWidget: (context,url, error)=>const Icon(Icons.error),
        ),
      ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: Text(bookModel.volumeInfo.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xff0047AB),
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),),
              ),
            ),

          ],
        ),
      )
    );
  }
}
