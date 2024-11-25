import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text Preview App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Enter text'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _sizeController,
                decoration: InputDecoration(labelText: 'Enter text size'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      String text = _textController.text;
                      double size =
                          double.tryParse(_sizeController.text) ?? 16.0;
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            text: text,
                            textSize: size,
                          ),
                        ),
                      );

                      if (result == 'Ok') {
                        _showDialog(context, 'Cool!');
                      } else if (result == 'Cancel') {
                        _showDialog(context, 'Let’s try something else.');
                      } else {
                        _showDialog(context, 'Don\'t know what to say.');
                      }
                    },
                    child: Text('Preview'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Message'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String text;
  final double textSize;

  SecondScreen({required this.text, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              text,
              style: TextStyle(fontSize: textSize),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Ok');
            },
            child: Text('Ok'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
