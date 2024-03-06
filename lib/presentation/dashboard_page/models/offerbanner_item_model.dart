class OfferbannerItemModel {
  final String title;
  final String imageURL;
  final String information;
  final String eventDate;

  OfferbannerItemModel({
    required this.title,
    required this.imageURL,
    required this.information,
    required this.eventDate,
  });

  factory OfferbannerItemModel.fromJson(Map<String, dynamic> json) {
    return OfferbannerItemModel(
      title: json['Title'],
      imageURL: json['ImageURL'],
      information: json['Information'],
      eventDate: json['EventDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'ImageURL': imageURL,
      'Information': information,
      'EventDate': eventDate,
    };
  }
}
