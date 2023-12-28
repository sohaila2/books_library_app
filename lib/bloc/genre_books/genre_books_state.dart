part of 'genre_books_cubit.dart';

@immutable
abstract class GenreBooksState {}

class GenreBooksInitial extends GenreBooksState {}

class GenreBooksLoading extends GenreBooksState {}


class GenreBooksSuccess extends GenreBooksState {

  final List<BookModel> books;

  GenreBooksSuccess(this.books);
}

class GenreBooksFailure extends GenreBooksState {

  final String errMessage;

  GenreBooksFailure(this.errMessage);
}