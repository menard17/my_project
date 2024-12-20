import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FastAPIExampleScreen extends StatefulWidget {
  @override
  _FastAPIExampleScreenState createState() => _FastAPIExampleScreenState();
}

class _FastAPIExampleScreenState extends State<FastAPIExampleScreen> {
  List<dynamic> _posts = [];

  Future<void> fetchPostsFromAPI() async {
    try {
      // Replace the URL with your FastAPI endpoint
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/get-properties'));

      if (response.statusCode == 200) {
        // Parse the response body into JSON
        final data = json.decode(response.body);

        // Extract the list of posts
        setState(() {
          _posts = data['posts'];
        });
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error: $e');
      // Handle errors (maybe show a SnackBar or an alert)
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPostsFromAPI(); // Fetch data when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Properties from FastAPI')),
      body: _posts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          var post = _posts[index];
          return ListTile(
            title: Text(post['Title']),
            subtitle: Text(post['Content']),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
