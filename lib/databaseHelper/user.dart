class User {
  final String fullName;
  final String email;
  final String password;

  User({
    required this.fullName,
    required this.email,
    required this.password,
  });

  // Convert a User into a Map. The keys must correspond to the names of the
  // columns in the database table.
  Map<String, dynamic> toMap() {
    return {
      'Name': fullName,
      'Email': email,
      'Password': password,
      
    };
  }

  // Convert a Map into a User. The Map must contain all of the fields as keys.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      fullName: map['Name'],
      email: map['Email'],
      password: map['Password'],
    );
  }

  // Override the toString method to return a custom string representation
  @override
  String toString() {
    return "User:{fullName: $fullName, email: $email, password: $password,}\n";
  }
}