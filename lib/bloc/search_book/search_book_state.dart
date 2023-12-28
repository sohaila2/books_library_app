part of 'search_book_cubit.dart';

@immutable
abstract class SearchBookState {}

class SearchBookInitial extends SearchBookState {}

final class SearchBookLoading extends SearchBookState {}

final class SearchBookClear extends SearchBookState {}


final class SearchBookSuccess extends SearchBookState {
  final List<BookModel> books;
   SearchBookSuccess(this.books);
}

final class SearchBookFailure extends SearchBookState {
  final String errMessage;
   SearchBookFailure(this.errMessage);
}