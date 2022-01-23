import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_york_times_books/BLoC/best_seller_bloc.dart';
import 'package:new_york_times_books/Models/book.dart';
import 'package:new_york_times_books/UI/Components/BooksListItem.dart';
import 'package:new_york_times_books/UI/Components/ListItemBuilder.dart';
import 'package:new_york_times_books/UI/Screens/book_details.dart';

class BooksList extends StatefulWidget {
  const BooksList({Key? key, required this.bestSellersBloc}) : super(key: key);
  final BestSellersBloc bestSellersBloc;

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  String date = "";

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    setDate(formattedDate);
    widget.bestSellersBloc.getBestSellers(formattedDate);
  }

  void setDate(String formattedDate) {
    setState(() {
      date = formattedDate;
    });
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
              onTap: () =>
                  BookDetailsPage.navigate(context, book.bookDetailsList[0]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectDate(context);
        },
        child: const Icon(Icons.calendar_today),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    print(date);
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(date),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      confirmText: "SELECT",
    );

    if (selectedDate != null) {
      var formatter = DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(selectedDate);

      setState(() {
        date = formattedDate;
      });
      widget.bestSellersBloc.getBestSellers(formattedDate);
    }
  }
}
