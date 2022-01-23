import 'package:flutter/material.dart';
import 'package:new_york_times_books/Models/book_details.dart';
import 'package:new_york_times_books/UI/Components/detail_item.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({Key? key, required this.bookDetails})
      : super(key: key);

  final BookDetails bookDetails;

  static Future<void> navigate(
      BuildContext context, BookDetails bookDetails) async {
    await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => BookDetailsPage(bookDetails: bookDetails)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookDetails.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DetailItem(label: "Title", content: bookDetails.title),
            const SizedBox(
              height: 12.0,
            ),
            DetailItem(label: "Description", content: bookDetails.description),
            const SizedBox(
              height: 12.0,
            ),
            DetailItem(label: "Author", content: bookDetails.author),
          ],
        ),
      ),
    );
  }
}
