import 'package:books_library_app/constants.dart';
import 'package:books_library_app/models/genres_model.dart';
import 'package:flutter/material.dart';

class GenreItem extends StatelessWidget {
  final GenresModel genresModel;
  final VoidCallback? onTap;
  const GenreItem({super.key, required this.genresModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff0047AB),
                Color(0xffc6c7f5),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.1, 0.7],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                genresModel.title,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}