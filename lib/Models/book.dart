import 'BookDetails.dart';

class Book {
  Book({required this.rank, required this.bookDetailsList});

  final int rank;
  final List<BookDetails> bookDetailsList;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      rank: json["rank"],
      bookDetailsList: List<BookDetails>.from(
          json["book_details"].map((x) => BookDetails.fromJson(x))),
    );
  }
}
