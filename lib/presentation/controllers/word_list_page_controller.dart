import 'package:english_dictionary/domain/entity/words_entity.dart';
import 'package:english_dictionary/domain/use_case/get_word_use_case.dart';
import 'package:english_dictionary/src/words_dictionary.dart';

class WordListPageController {
  Word? wordDescription;
  final WordsDictionary? wordsDictionary;
  late List<String>? allWords;
  final GetWordUseCase? getWordUseCase;

  WordListPageController(
      {this.wordsDictionary, this.getWordUseCase, this.wordDescription});

  call(String word) async {
    wordDescription = await getWordUseCase?.call(word);
  }

  convertJsonToList() async {
    allWords = wordsDictionary?.words.entries.map((e) => e.key).toList();
  }
}
