import 'package:flutter/material.dart';
import 'package:my_project/models/user.dart';
import 'package:my_project/services/firestore_service.dart';

class FirestoreExample extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Function to add user data
  void _addUser() {
    String name = _nameController.text;
    String email = _emailController.text;
    String ageString = _ageController.text;

    if (name.isEmpty || email.isEmpty || ageString.isEmpty) {
      // Show a message to the user indicating fields cannot be empty
      debugPrint("All fields must be filled out.");
      return;
    }

    // Try parsing the age input to ensure it's a valid number
    int? age = int.tryParse(ageString);
    if (age == null) {
      // Show an error message if the age is not a valid number
      debugPrint("Please enter a valid age.");
      return;
    }

    User newUser = User(name: name, age: age, email: email);
    _firestoreService.addUser(newUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addUser,
              child: const Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}
