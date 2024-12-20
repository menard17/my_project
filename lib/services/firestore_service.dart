import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_project/models/user.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a user to Firestore
  Future<void> addUser(User user) async {
    try {
      await _db.collection('users').add(user.toMap());
      debugPrint("User added successfully!");
    } catch (e) {
      debugPrint("Failed to add user: $e");
    }
  }

  // Fetch all users from Firestore
  Stream<List<User>> getUsers() {
    return _db.collection('users')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => User.fromFirestore(doc.data()))
        .toList());
  }
}
