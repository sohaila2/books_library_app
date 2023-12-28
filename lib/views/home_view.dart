import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:books_library_app/constants.dart';
import 'package:books_library_app/models/book_model/book_model.dart';
import 'package:books_library_app/models/genres_model.dart';
import 'package:books_library_app/views/book_details_view.dart';
import 'package:books_library_app/views/genre_view.dart';
import 'package:books_library_app/widgets/custom_menu_icon.dart';
import 'package:books_library_app/widgets/home/current_reading_section.dart';
import 'package:books_library_app/widgets/custom_search_bar.dart';
import 'package:books_library_app/widgets/home/new_releases_item.dart';
import 'package:books_library_app/widgets/home/new_releases_list_view.dart';
import 'package:expandable_search_bar/expandable_search_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';
import '../widgets/home/genre_item.dart';

class HomeView extends StatefulWidget {
    HomeView({super.key});

    static const String id = 'HomeView';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    TextEditingController textController = TextEditingController();

    @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerWidget(),
        body: CustomScrollView(
          slivers :[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomMenuIcon(scaffoldKey: _scaffoldKey),

                        const Expanded(
                          child: CustomSearchBar(),
                        )
                      ],
                    ),
                    Text("Currently reading",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                      ),),
                    const SizedBox(
                      height: 8,
                    ),
                    CurrentReadingSection(),
                    const SizedBox(
                      height: 6,
                    ),
                    Text("New Releases",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                      ),),
                    const SizedBox(
                      height: 8,
                    ),
                    const NewReleasesListView(),
                    Text("Genres",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                      ),),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (1 / .4),
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return GenreItem(genresModel: genresList[index],
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenreView(genresModel: genresList[index]),
                        ),
                      );
                    },);
                  },
                  childCount: genresList.length,
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
