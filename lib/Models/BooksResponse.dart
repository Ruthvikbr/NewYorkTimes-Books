import 'package:new_york_times_books/Models/book.dart';

class BooksResponse {
  BooksResponse({required this.results});

  final List<Book> results;

  factory BooksResponse.fromJson(Map<String, dynamic> json) {
    return BooksResponse(
      results: List<Book>.from(json["results"].map( (x) => Book.fromJson(x))),
    );
  }
}
