import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:new_york_times_books/BLoC/best_seller_bloc.dart';
import 'package:new_york_times_books/Models/books_response.dart';
import 'fetch_books_test.mocks.dart';

@GenerateMocks([BooksResponse, BestSellersBloc])
void main() {
  group("Fetch Books", () {
    test("returns a list of books if the http call completes successfully",
        () async {
      final MockBestSellersBloc bestSellersBloc = MockBestSellersBloc();

      when(bestSellersBloc.getBestSellersMethod("2020-01-01")).thenAnswer((_) =>
          BooksResponse.fromJson(jsonDecode(
              '{"results": [{"rank": 1,"book_details": [{"title": "MOCK TITLE","description": "Mock description","author": "Mock Author"}]}]}')));

      expect(bestSellersBloc.getBestSellersMethod("2020-01-01"),
          isA<BooksResponse>());
    });

    test("returns an exception if the http call fails", () async {
      final MockBestSellersBloc bestSellersBloc = MockBestSellersBloc();

      when(bestSellersBloc.getBestSellersMethod("")).thenThrow(Exception);

      expect(
          () => bestSellersBloc.getBestSellersMethod(""), throwsA(Exception));
    });
  });
}
