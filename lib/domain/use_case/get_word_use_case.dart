import 'package:english_dictionary/domain/entity/words_entity.dart';

abstract class GetWordUseCase {
  Future<Word> call();

}