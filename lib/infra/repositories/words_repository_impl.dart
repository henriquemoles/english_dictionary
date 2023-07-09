import 'package:english_dictionary/domain/entity/words_entity.dart';
import 'package:english_dictionary/domain/repositories/words_repository.dart';
import 'package:english_dictionary/infra/datasources/words_datasource.dart';

class WordsRepositoryImpl implements WordsRepository {
  final WordsDatasource datasource;

  WordsRepositoryImpl(this.datasource);

  @override
  Future<Word> getWord(String word) {
    return datasource.getWord(word);
  }
}
