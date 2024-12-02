import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IPZ: Anatoliy\'s last Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Calculator calculator = Calculator();
  double result = 0;

  void _calculate(double x) {
    setState(() {
      result = calculator.calculate(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IPZ: Anatoliy\'s last Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Result: $result'),
            FloatingActionButton(
              onPressed: () => _calculate(2), // Example calculation with x = 2
              child: Icon(Icons.calculate),
            ),
          ],
        ),
      ),
    );
  }
}
