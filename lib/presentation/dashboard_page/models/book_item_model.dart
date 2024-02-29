import 'package:equatable/equatable.dart';

class BookItem extends Equatable {
  final double avgRating;
  final List<String> categories;
  final String author;
  final String description;
  final String format;
  final String isbn10;
  final String imageURL;
  final int numberOfSellers;
  final double price;
  final String publishedDate;
  final int reviewsCount;
  final String title;

  BookItem({
    required this.avgRating,
    required this.categories,
    required this.author,
    required this.description,
    required this.format,
    required this.isbn10,
    required this.imageURL,
    required this.numberOfSellers,
    required this.price,
    required this.publishedDate,
    required this.reviewsCount,
    required this.title,
  });

  factory BookItem.fromJson(Map<String, dynamic> json) {
    return BookItem(
      avgRating: json['AvgRating'],
      categories: List<String>.from(json['Categories']),
      author: json['Author'],
      description: json['Description'],
      format: json['Format'],
      isbn10: json['ISBN10'],
      imageURL: json['ImageURL'],
      numberOfSellers: json['NumberOfSellers'],
      price: json['Price'].toDouble(),
      publishedDate: json['PublishedDate'],
      reviewsCount: json['ReviewsCount'],
      title: json['Title'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}