import 'package:english_dictionary/domain/entity/words_entity.dart';
import 'package:english_dictionary/domain/use_case/get_word_use_case.dart';
import 'package:english_dictionary/presentation/pages/word_detail_page.dart';
import 'package:english_dictionary/src/words_dictionary.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordListPageController {
  Word? wordDescription;
  List<String> myHistory = [];
  List<String> suggestion = [];
  List<String> finalListWords = [];
  final WordsDictionary? wordsDictionary;
  late List<String>? allWords;
  final GetWordUseCase? getWordUseCase;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController? searchController;

  WordListPageController({
    this.wordsDictionary,
    this.getWordUseCase,
    this.wordDescription,
    this.searchController,
  });

  getData() async {
    final SharedPreferences prefs = await _prefs;
    myHistory = prefs.getStringList('history') ?? [];
  }

  savedata(String word) async {
    final SharedPreferences prefs = await _prefs;
    if (myHistory.isEmpty) {
      myHistory.add(word);
      prefs.setStringList('history', myHistory);
    } else {
      prefs.setStringList('history', myHistory);
    }
  }

  verifyDuplicityInHistory(String word) {
    if (myHistory.contains(word)) {
    } else {
      myHistory.add(word);
    }
  }

  call(String word, BuildContext context) async {
    verifyDuplicityInHistory(word);
    savedata(word);
    wordDescription = await getWordUseCase!.call(word);
    if (wordDescription?.success == false &&
        wordDescription?.message == "word not found") {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Word Not Found')));
    } else if (wordDescription?.success == false) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Aplication error')));
    } else if (wordDescription?.success == null &&
        wordDescription?.message == null &&
        wordDescription!.results != null) {
      Navigator.pushNamed(context, WordDetailPage.routeName,
          arguments: wordDescription);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unknown Error'),
        ),
      );
    }
  }

  void searchBook(String text) {
    suggestion = allWords!.where((word) {
      final lowerWord = word.toLowerCase();
      return lowerWord.contains(text);
    }).toList();
  }

  convertJsonToList() async {
    allWords = wordsDictionary?.words.entries.map((e) => e.key).toList();
  }
}
