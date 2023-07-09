import 'package:english_dictionary/src/words_dictionary.dart';

class WordListPageController {
  final WordsDictionary wordsDictionary;
  late List<String> allWords;

  WordListPageController(this.wordsDictionary);
  convertJsonToList() async {
    allWords = wordsDictionary.words.entries.map((e) => e.key).toList();
  }
}
