import 'package:english_dictionary/domain/entity/words_entity.dart';
import 'package:english_dictionary/domain/repositories/words_repository.dart';
import 'package:english_dictionary/domain/use_case/get_word_use_case.dart';

class GetWordUseCaseImpl extends GetWordUseCase {
  WordsRepository wordsRepository;
  GetWordUseCaseImpl({
    required this.wordsRepository,
  });
  @override
  Future<Word> call(String word) async {
    final result = await wordsRepository.getWord(word);
    return result;
  }
}
