


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/book_model/book_model.dart';
import '../widgets/custom_menu_icon.dart';
import '../widgets/home/new_releases_item.dart';

class DownloadsView extends StatelessWidget {
  final List<BookModel> downloadsBooks;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static const String id = 'DownloadsView';

  DownloadsView({required this.downloadsBooks});

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
            Text('My Downloads',
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
          itemCount: downloadsBooks.length,
          itemBuilder: (context, index) {
            BookModel book = downloadsBooks[index];
            return NewReleasesItem(bookModel: book);
          },
        ),
      ),
    );
  }
}
