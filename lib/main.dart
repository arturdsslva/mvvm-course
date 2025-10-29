import 'package:flutter/material.dart';
import 'package:mvvm_course/routing/router.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: routerConfig());
  }
}
