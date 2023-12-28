import 'package:bloc/bloc.dart';
import 'package:books_library_app/services/book_service.dart';
import 'package:meta/meta.dart';

import '../../models/book_model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.bookService) : super(FeaturedBooksInitial());

  final BookService bookService;
  Future<void> fetchFeaturedBooks() async{
    emit(FeaturedBooksLoading());
    try{
         await bookService.fetchFeaturedBooks();
        emit(FeaturedBooksSuccess(bookService.books));
    }
    on Exception catch (e){
FeaturedBooksFailure('can not show books');
    }
  }
}
