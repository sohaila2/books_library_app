import 'package:books_library_app/widgets/home/current_reading_section.dart';
import 'package:books_library_app/widgets/custom_search_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_book/search_book_cubit.dart';
import '../constants.dart';
import '../services/api_service.dart';
import '../services/book_service.dart';
import '../widgets/custom_error_widget.dart';
import '../widgets/home/current_reading_item.dart';
import '../widgets/home/new_releases_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchBar(),
              const Center(child: Text('Search result',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                ),)),
              const SizedBox(height: 20),
              BlocBuilder<SearchBookCubit, SearchBookState>(
                builder: (context, state) {
                  if (state is SearchBookInitial){
                    return Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 200),
                              Icon(
                                Icons.search,
                                size: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.25,
                                color: Colors.white.withOpacity(0.7),
                              ),
                              Text(
                                'Please enter book name or category to search',

                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (state is SearchBookSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CurrentReadingItem(bookModel: state.books[index]),
                          );
                        },
                      ),
                    );
                  } else if (state is SearchBookFailure) {
                    return CustomErrorWidget(errMessage: 'opps');
                  } else {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
