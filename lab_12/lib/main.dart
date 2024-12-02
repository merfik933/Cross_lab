import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 12 Dio Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://lab12.requestcatcher.com/';

  // Controllers для форм
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Функція для надсилання запитів
  Future<void> _sendRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        '$_baseUrl$endpoint',
        data: data,
      );
      print('Response: ${response.data}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Success: ${response.statusCode}')),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 12')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _sendRequest('login', {
                'email': _emailController.text,
                'password': _passwordController.text,
              }),
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => _sendRequest('signup', {
                'email': _emailController.text,
                'password': _passwordController.text,
              }),
              child: const Text('Sign up'),
            ),
            ElevatedButton(
              onPressed: () => _sendRequest('reset', {
                'email': _emailController.text,
              }),
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
