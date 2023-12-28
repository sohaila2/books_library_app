import 'package:books_library_app/widgets/book_details/book_details_section.dart';
import 'package:books_library_app/widgets/book_details/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/book_model/book_model.dart';
import '../widgets/book_details/custom_alert_dialog.dart';
import '../widgets/book_details/custom_gradient_button.dart';
import '../widgets/book_details/custom_share_alert_dialog.dart';
import '../widgets/custom_menu_icon.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/launch_url.dart';
import 'downloads_view.dart';
import 'favorite_view.dart';

class BookDetailsView extends StatelessWidget {
  BookDetailsView({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static const String id = 'BookDetailsView';

  @override
  Widget build(BuildContext context) {
    BookModel bookModel = ModalRoute.of(context)!.settings.arguments as BookModel;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.only(top: 22,left: 12,right: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomMenuIcon(scaffoldKey: _scaffoldKey),
                const SizedBox(
                  height: 12,
                ),
                 BookDetailsSection(bookModel: bookModel,),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      icon: Icon(Icons.bookmark),
                      text: '\t\t\tAdd to\nfavourites',
                      onPress: () {
                        List<BookModel> favoriteBooks = [];
                        favoriteBooks.add(bookModel);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return  CustomAlertDailog(title: 'Added to favorites',
                              firstButton: '\t\t\tGo to\nfavorites',
                              icon: Icons.bookmark, navigateTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => FavoritesView(favoriteBooks: favoriteBooks),
                                  ),
                                );
                              }, confirmTap: () {
                                Navigator.pop(context);
                              },);

                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    CustomButton(
                      icon: Icon(Icons.file_download_outlined,),
                      text: 'Download\n',
                      onPress: () {
                        try{
                          var url = bookModel.accessInfo?.pdf?.isAvailable;
                          if(url == true)
                          {
                            launchCustomUrl(context, bookModel.accessInfo?.pdf?.acsTokenLink);
                          }
                        }
                        catch (e) {
                          print("Not available");
                        }
                        List<BookModel> downloadsBooks = [];
                        downloadsBooks.add(bookModel);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDailog(title: 'Downloaded Successfully',
                                firstButton: '\t\t\tGo to\ndownloads', icon: Icons.download, navigateTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DownloadsView(downloadsBooks: downloadsBooks),
                                  ),
                                );

                              }, confirmTap: () {
                                Navigator.pop(context);

                              },);
                          },
                        );
                      },
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CustomButton(
                      icon: Icon(Icons.share),
                      text: 'Share\n',
                      onPress: () {
                        showDialog(
                            context: context, builder: (BuildContext context){
                          return const CustomShareAlertDialog();
                        }
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                Center(
                  child: CustomGradientButton(bookModel: bookModel, width: 200, text: 'Start Reading',),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




