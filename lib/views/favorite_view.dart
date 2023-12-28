import 'package:books_library_app/bloc/featured_books/featured_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/genre_books/genre_books_cubit.dart';
import '../constants.dart';
import '../models/book_model/book_model.dart';
import '../services/api_service.dart';
import '../services/book_service.dart';
import '../widgets/custom_menu_icon.dart';
import '../widgets/home/new_releases_item.dart';

class FavoritesView extends StatefulWidget {
   final List<BookModel> favoriteBooks;
   static const String id = 'FavoritesView';

  FavoritesView({required this.favoriteBooks});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CustomMenuIcon(scaffoldKey: _scaffoldKey),
            SizedBox(
              width: 50,
            ),
            Text('My favorites',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor,
              ),),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.6),
          ),
          itemCount: widget.favoriteBooks.length,
          itemBuilder: (context, index) {
            BookModel book = widget.favoriteBooks[index];
            return NewReleasesItem(bookModel: book);
          },
        ),
      ),
    );
  }
}
