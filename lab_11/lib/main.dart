import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'container_model.dart';
import 'sliders_section.dart';
import 'container_display.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContainerModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Container Configurator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Container Configurator')),
        body: Column(
          children: [
            Expanded(flex: 2, child: SlidersSection()),
            Expanded(flex: 3, child: ContainerDisplay()),
          ],
        ),
      ),
    );
  }
}
