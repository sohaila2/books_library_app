import 'package:books_library_app/bloc/featured_books/featured_books_cubit.dart';
import 'package:books_library_app/models/book_model/book_model.dart';
import 'package:books_library_app/widgets/custom_book_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../custom_error_widget.dart';
import 'current_reading_item.dart';

class CurrentReadingSection extends StatelessWidget {
  const CurrentReadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
       if(state is FeaturedBooksSuccess){
         return Padding(
           padding: const EdgeInsets.symmetric(vertical: 8.0),
           child: CurrentReadingItem(bookModel: state.books[0],),
         );
       }
       else if(state is FeaturedBooksFailure){
         return CustomErrorWidget(errMessage: 'opps there is a problem');
       }
       else{
         return const CircularProgressIndicator();
       }
      },
    );
  }
}

