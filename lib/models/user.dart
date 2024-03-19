class User {
  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print(json);
    return User(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      phoneNumber: json['phone_number'],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phoneNumber,
      "email": email,
    };
  }
}
