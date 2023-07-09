import 'package:english_dictionary/infra/models/words_model.dart';

abstract class WordsDatasource {
  Future<WordsModel> getWord(String word);
}
