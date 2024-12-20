import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_project/screens/add_user_screen.dart';
import 'package:my_project/screens/fastapi_example_screen.dart';
import 'package:my_project/screens/show_users_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Firestore Example',
      initialRoute: '/', // Ensure that a route is defined
      routes: {
        '/': (context) => const HomeScreen(),
        '/addUser': (context) => AddUserScreen(),
        '/showUsers': (context) => ShowUsersScreen(),
        '/fastApi': (context) => FastAPIExampleScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cloud Firestore Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addUser');
              },
              child: const Text('Add User to Firestore'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/showUsers');
              },
              child: const Text('Show Users from Firestore'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fastApi');
              },
              child: const Text('Show Users from FastAPI'),
            ),
          ],
        ),
      ),
    );
  }
}
