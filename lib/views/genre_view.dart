
import 'package:books_library_app/services/api_service.dart';
import 'package:books_library_app/services/book_service.dart';
import 'package:books_library_app/widgets/custom_menu_icon.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/genre_books/genre_books_cubit.dart';
import '../models/genres_model.dart';
import '../widgets/home/new_releases_item.dart';

class GenreView extends StatelessWidget {
  final GenresModel genresModel;

   GenreView({Key? key, required this.genresModel}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CustomMenuIcon(scaffoldKey: _scaffoldKey),
            SizedBox(
              width: 60,
            ),
            Text(genresModel.title),

          ],
        ),
        centerTitle: true, automaticallyImplyLeading: false
      ),
      body: BlocProvider(
        create: (context) => GenreBooksCubit(BookService(ApiService(Dio())), genresModel)..fetchGenreBooks(),
        child: BlocBuilder<GenreBooksCubit, GenreBooksState>(
          builder: (context, state) {
            if (state is GenreBooksLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GenreBooksSuccess) {
              return Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.6),

                  ),
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return NewReleasesItem(bookModel: state.books[index]);
                  },
                ),
              );
            } else if (state is GenreBooksFailure) {
              return Center(
                child: Text('state.error'),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}