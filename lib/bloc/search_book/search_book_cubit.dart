import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/book_model/book_model.dart';
import '../../services/book_service.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.bookService) : super(SearchBookInitial());
  final BookService bookService;

  Future<void> searchBook({required String searchText}) async{
    emit(SearchBookLoading());
    try{
      await bookService.searchBook(searchText: searchText);
      emit(SearchBookSuccess(bookService.books));
    }
    on Exception catch (e){
      SearchBookFailure('can not show books');
    }
  }
  void clearSearchResults() {
    bookService.books.clear();
    emit(SearchBookClear());
  }
}
