class BookDetails {
  BookDetails(
      {required this.title, required this.description, required this.author});

  final String title;
  final String description;
  final String author;

  factory BookDetails.fromJson(Map<String, dynamic> json) {
    return BookDetails(
      title: json["title"],
      description: json["description"],
      author: json["author"],
    );
  }
}
