

import 'package:flutter/material.dart';

class CustomMenuIcon extends StatelessWidget {
  const CustomMenuIcon({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 37,
      decoration: ShapeDecoration(
        color: Colors
            .transparent, // Set the color of the surrounding area (or use Colors.transparent for no background)
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xff0047AB), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(
              8.0)), // Adjust the border radius as needed
        ),
      ),
      child: Center(
        child: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            iconSize: 20,
            icon: Icon(
              Icons.menu_sharp,
              color: Color(0xff0047AB),
            )),
      ),
    );
  }
}
