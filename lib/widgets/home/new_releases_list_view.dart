import 'package:books_library_app/bloc/newest_books/newest_books_cubit.dart';
import 'package:books_library_app/widgets/home/new_releases_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_error_widget.dart';

class NewReleasesListView extends StatelessWidget {
  const NewReleasesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
      if(state is NewestBooksSuccess){
        return SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * .3,
          child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: NewReleasesItem(bookModel: state.books[index],),
                );
              }),
        );
      } else if(state is NewestBooksFailure){
        return CustomErrorWidget(errMessage: 'opps there is a problem');
      }
      else{
        return const CircularProgressIndicator();
      }
      },
    );
  }
}
