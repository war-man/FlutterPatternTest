class UserModel {
  final String userName;
  final String userEmail;
  final String password;

  UserModel({this.userName, this.userEmail, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userName: json['Username'],
        userEmail: json['Email'],
        password: json['Password']);
  }
  toJson() {
    return {
      'Username': this.userName,
      'Email': this.userEmail,
      'Password': this.password,
    };
  }
}
