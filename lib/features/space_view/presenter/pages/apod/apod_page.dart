import 'package:flutter/material.dart';

class ApodPage extends StatefulWidget {
  const ApodPage({super.key});

  @override
  State<ApodPage> createState() => _ApodPageState();
}

class _ApodPageState extends State<ApodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Something now'),
        leadingWidth: 50,
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
