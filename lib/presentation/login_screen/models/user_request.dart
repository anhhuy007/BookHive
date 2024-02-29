class UserRequest {
  final String email;
  final String password;

  UserRequest({required this.email, required this.password});

  factory UserRequest.fromJson(Map<String, dynamic> json) {
    return UserRequest(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}