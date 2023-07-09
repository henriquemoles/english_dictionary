import 'package:english_dictionary/presentation/controllers/home_page_controller.dart';
import 'package:english_dictionary/presentation/pages/favorites_page.dart';
import 'package:english_dictionary/presentation/pages/history_page.dart';
import 'package:english_dictionary/presentation/pages/word_list_page.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(HomePageController());
}

class _MyHomePageState extends State<MyHomePage> {
  final HomePageController homePageController;
  _MyHomePageState(this.homePageController);

  @override
  void initState() {
    homePageController.pc =
        PageController(initialPage: homePageController.paginaAtual);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: GNav(
            selectedIndex: homePageController.paginaAtual,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            onTabChange: (index) {
              homePageController.pc.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease);
            },
            padding: const EdgeInsets.all(12),
            tabs: const [
              GButton(
                icon: Icons.list,
                text: 'Word list',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'History',
              ),
              GButton(
                icon: Icons.history,
                text: 'Favorites',
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: homePageController.pc,
        children: const [
          WordListPage(),
          HistoryPage(),
          FavoritesPage(),
        ],
      ),
    );
  }
}
