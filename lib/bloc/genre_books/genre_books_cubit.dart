import 'package:bloc/bloc.dart';
import 'package:books_library_app/models/genres_model.dart';
import 'package:meta/meta.dart';

import '../../models/book_model/book_model.dart';
import '../../services/book_service.dart';

part 'genre_books_state.dart';

class GenreBooksCubit extends Cubit<GenreBooksState> {
  GenreBooksCubit(this.bookService, this.genresModel) : super(GenreBooksInitial());
  final BookService bookService;
  final GenresModel genresModel;
  Future<void> fetchGenreBooks() async{
    emit(GenreBooksLoading());
    try{
      await bookService.fetchGenreBooks(subject: genresModel.title);
      emit(GenreBooksSuccess(bookService.books));
    }
    on Exception catch (e){
      GenreBooksFailure('can not show books');
    }
  }
}
