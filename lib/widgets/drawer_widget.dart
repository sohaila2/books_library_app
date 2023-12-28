import 'package:books_library_app/views/home_view.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 242,
      backgroundColor: Color(0xff0047AB),
      child: Padding(
        padding: const EdgeInsets.only(top: 120,left: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home_outlined,
              color: Colors.white,),
              title: Text('Home',
                style: TextStyle(
                    fontSize: 22,
                  color: Colors.white
                ),),
              onTap: () {
             Navigator.pushNamed(context, HomeView.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book_outlined,
                color: Colors.white,),
              title: Text('Reading',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                ),),
              onTap: () {
                // Handle settings navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.star_border_sharp,
                color: Colors.white,),
              title: Text('Favorites',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                ),),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.file_download_outlined,
              color: Colors.white,),
              title: Text('Downloads',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                ),),
              onTap: () {
                // Handle home navigation
                Navigator.pop(context);
              },
            ),
            // Add more ListTile widgets for additional menu items
          ],
        ),
      ),
    );
  }
}
