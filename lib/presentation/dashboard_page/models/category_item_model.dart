import 'package:equatable/equatable.dart';

class CategoryItem extends Equatable{
  final String imageURL;
  final String name;

  CategoryItem({
    required this.imageURL,
    required this.name,
  });

  factory CategoryItem.initial() {
    return CategoryItem(
      imageURL: '',
      name: '',
    );
  }

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      imageURL: json['ImageURL'],
      name: json['Name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ImageURL': imageURL,
      'Name': name,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
