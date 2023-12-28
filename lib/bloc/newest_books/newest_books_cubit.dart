import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/book_model/book_model.dart';
import '../../services/book_service.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.bookService) : super(NewestBooksInitial());

  final BookService bookService;
  Future<void> fetchNewestBooks() async{
    emit(NewestBooksLoading());
    try{
      await bookService.fetchNewestBooks();
      emit(NewestBooksSuccess(bookService.books));
    }
    on Exception catch (e){
      NewestBooksFailure('can not show books');
    }
  }
}
