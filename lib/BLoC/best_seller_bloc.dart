import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:new_york_times_books/constants.dart';
import 'package:new_york_times_books/Models/book.dart';
import 'dart:convert';

import 'package:new_york_times_books/Models/BooksResponse.dart';

class BestSellersBloc {
  final StreamController<List<Book>> _booksStreamController =
      StreamController<List<Book>>();

  Stream<List<Book>> get booksStream => _booksStreamController.stream;

  void dispose() {
    _booksStreamController.close();
  }

  void _addBooks(List<Book> booksResponse) =>
      _booksStreamController.add(booksResponse);

  void getBestSellers() async {
    final response = await http.get(
        Uri.parse("${Constants.bestSellersUrl}&api-key=${Constants.apiKey}"));
    if (response.statusCode == 200) {
      try {
        final BooksResponse booksResponse =
            BooksResponse.fromJson(jsonDecode(response.body.toString()));

        _addBooks(booksResponse.results);
      } catch (e) {
        print(e);
      }
    }
  }
}
