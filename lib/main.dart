import 'package:english_dictionary/presentation/pages/home_page.dart';
import 'package:english_dictionary/presentation/pages/word_detail_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        WordDetailPage.routeName: (context) =>
        const WordDetailPage(),
      },
      darkTheme: ThemeData.dark(),
      title: 'english dictionary',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}
