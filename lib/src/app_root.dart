import 'package:books_library_app/bloc/featured_books/featured_books_cubit.dart';
import 'package:books_library_app/bloc/newest_books/newest_books_cubit.dart';
import 'package:books_library_app/services/api_service.dart';
import 'package:books_library_app/services/book_service.dart';
import 'package:books_library_app/views/book_details_view.dart';
import 'package:books_library_app/views/home_view.dart';
import 'package:books_library_app/views/search_view.dart';
import 'package:books_library_app/views/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_book/search_book_cubit.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> FeaturedBooksCubit(BookService(ApiService(Dio())))..fetchFeaturedBooks()),
        BlocProvider(create: (context)=> NewestBooksCubit(BookService(ApiService(Dio())))..fetchNewestBooks()),
    BlocProvider(create: (context)=>   SearchBookCubit(BookService(ApiService(Dio())))),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashView.id: (context) =>  const SplashView(),
          BookDetailsView.id: (context) =>  BookDetailsView(),
          HomeView.id: (context) => HomeView(),
           SearchView.id:(context) => const SearchView(),

        },
        initialRoute: SplashView.id,
      ),
    );
  }
}
