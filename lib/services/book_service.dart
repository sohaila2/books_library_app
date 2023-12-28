

import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/book_model/book_model.dart';
import 'api_service.dart';

class BookService{

final ApiService apiService;

List<BookModel> books = [];


BookService(this.apiService);

  Future<List<BookModel>> fetchFeaturedBooks()async {

      var response = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=subject:Programming');

      for (var item in response['items']) {
        try{
          books.add(BookModel.fromJson(item));
        }catch (e){
          books.add(BookModel.fromJson(item));
        }
      }
      return books;
    }

Future<List<BookModel>> fetchGenreBooks({required String subject})async {

  var response = await apiService.get(
      endPoint:
      'volumes?Filtering=free-ebooks&q=$subject');

  for (var item in response['items']) {
    try{
      books.add(BookModel.fromJson(item));
    }catch (e){
      books.add(BookModel.fromJson(item));
    }
  }
  return books;
}
Future<List<BookModel>> searchBook({required String searchText}) async {

  var response = await apiService.get(
      endPoint:
      'volumes?Filtering=free-ebooks&q=$searchText');

  for (var item in response['items']) {
    try{
      books.add(BookModel.fromJson(item));
    }catch (e){
      books.add(BookModel.fromJson(item));
    }
  }
  return books;
}
Future<List<BookModel>> fetchNewestBooks()async {

  var response = await apiService.get(
      endPoint:
      'volumes?Filtering=free-ebooks&q=subject:computer science&Sorting=newest');

  for (var item in response['items']) {
    try{
      books.add(BookModel.fromJson(item));
    }catch (e){
      books.add(BookModel.fromJson(item));
    }
  }
  return books;
}
    }



