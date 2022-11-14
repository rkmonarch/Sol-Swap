import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LargestAccountScreen extends StatefulWidget {
  const LargestAccountScreen({super.key});

  @override
  State<LargestAccountScreen> createState() => _LargestAccountScreenState();
}

class _LargestAccountScreenState extends State<LargestAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
