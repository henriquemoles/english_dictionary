import 'package:english_dictionary/constants/english_dictionary_constants.dart';
import 'package:english_dictionary/core/service/http_service.dart';
import 'package:english_dictionary/infra/datasources/words_datasource.dart';
import 'package:english_dictionary/infra/models/words_model.dart';

class WordsDataSourceImpl implements WordsDatasource {
  final HttpService httpService;

  WordsDataSourceImpl({required this.httpService});

  @override
  Future<WordsModel> getWord(String word) async {
    return httpService.call(
      url: '${EnglishDictionaryConstants().wordsApiRequestUrl}$word',
      type: RestType.get,
    );
  }
}
