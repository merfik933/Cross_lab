import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('com.example.your_app_name/date');
  String _currentDate = 'Unknown';

  File? _image;

  Future<void> _getCurrentDate() async {
    try {
      final String result = await platform.invokeMethod('getCurrentDate');
      setState(() {
        _currentDate = result;
      });
    } on PlatformException catch (e) {
      setState(() {
        _currentDate = "Failed to get date: '${e.message}'.";
      });
    }
  }

  Future<void> _pickImage() async {
    final PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    } else {
      // Handle permission denied
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Camera permission is required')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Camera and Date')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _getCurrentDate,
              child: const Text('Get Current Date'),
            ),
            Text('Current Date: $_currentDate'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Take a Photo'),
            ),
            if (_image != null) ...[
              const SizedBox(height: 20),
              Image.file(_image!),
            ],
          ],
        ),
      ),
    );
  }
}
