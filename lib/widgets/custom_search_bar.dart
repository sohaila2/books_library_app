import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:books_library_app/views/search_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_book/search_book_cubit.dart';
import '../constants.dart';
import '../services/api_service.dart';
import '../services/book_service.dart';


class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
        suffixIcon: Icon(Icons.search,
        ),
        searchIconColor: Colors.white,
        textFieldColor: kPrimaryColor,
        textFieldIconColor: kPrimaryColor,
        width: 240,
        textController: textController,
        onSuffixTap: () {
          setState(() {
            textController.clear();
          });
        },
        color: kPrimaryColor,
        helpText: "Search",
        autoFocus: true,
        closeSearchOnSuffixTap: true,
        animationDurationInMilli: 500,
        rtl: true,
        onSubmitted: (value) {
         BlocProvider.of<SearchBookCubit>(context).clearSearchResults();
          BlocProvider.of<SearchBookCubit>(context).searchBook(
              searchText: value);
          Navigator.pushNamed(context, SearchView.id);

        }
    );
  }
}