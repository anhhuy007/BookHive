class AuthModel {
  final List<UserData> data;
  final Meta meta;

  AuthModel({required this.data, required this.meta});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<UserData> userDataList =
    dataList.map((data) => UserData.fromJson(data)).toList();

    return AuthModel(
      data: userDataList,
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class UserData {
  final int id;
  final Attributes attributes;

  UserData({required this.id, required this.attributes});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      attributes: Attributes.fromJson(json['attributes']),
    );
  }
}

class Attributes {
  final String email;
  final String password;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;

  Attributes({
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      email: json['email'],
      password: json['password'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      publishedAt: json['publishedAt'],
    );
  }
}

class Meta {
  final Pagination pagination;

  Meta({required this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'],
      pageSize: json['pageSize'],
      pageCount: json['pageCount'],
      total: json['total'],
    );
  }
}

