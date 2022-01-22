import 'package:flutter/material.dart';
import 'package:new_york_times_books/BLoC/best_seller_bloc.dart';
import 'package:new_york_times_books/Models/book.dart';
import 'package:new_york_times_books/UI/Components/BooksListItem.dart';
import 'package:new_york_times_books/UI/Components/ListItemBuilder.dart';
import 'package:provider/provider.dart';

class BooksList extends StatefulWidget {
  const BooksList({Key? key, required this.bestSellersBloc}) : super(key: key);
  final BestSellersBloc bestSellersBloc;

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  void initState() {
    super.initState();
    widget.bestSellersBloc.getBestSellers();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Book>>(
        stream: widget.bestSellersBloc.booksStream,
        initialData: const <Book>[],
        builder: (context, snapshot) {
          return _buildContent(context, snapshot);
        });
  }

  Widget _buildContent(
      BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Best sellers"),
      ),
      body: ListItemBuilder<Book>(
          snapshot: snapshot,
          itemWidgetBuilder: (context, book) {
            return BooksListItem(
              book: book,
              onTap: () {},
            );
          }),
    );
  }
}
