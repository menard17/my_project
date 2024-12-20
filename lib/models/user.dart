class User {
  String name;
  int age;
  String email;

  User({required this.name, required this.age, required this.email});

  // Convert User to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'email': email,
    };
  }

  // Create User from Firestore document snapshot
  factory User.fromFirestore(Map<String, dynamic> firestoreDoc) {
    return User(
      name: firestoreDoc['name'],
      age: firestoreDoc['age'],
      email: firestoreDoc['email'],
    );
  }
}
