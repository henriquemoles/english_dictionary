
import 'package:english_dictionary/domain/entity/words_entity.dart';
import 'package:english_dictionary/domain/use_case/get_word_use_case.dart';
import 'package:english_dictionary/presentation/pages/word_detail_page.dart';
import 'package:english_dictionary/src/words_dictionary.dart';
import 'package:flutter/material.dart';

class WordListPageController {
  Word? wordDescription;
  final WordsDictionary? wordsDictionary;
  late List<String>? allWords;
  final GetWordUseCase? getWordUseCase;

  WordListPageController(
      {this.wordsDictionary, this.getWordUseCase, this.wordDescription});

  call(String word, BuildContext context) async {
    wordDescription = await getWordUseCase!.call(word);
    if(wordDescription?.success == false && wordDescription?.message == "word not found"){
ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Word Not Found')));
    }else if(wordDescription?.success == false){
ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Aplication error')));
    }else if(wordDescription?.success == null && wordDescription?.message == null && wordDescription!.results != null){
     Navigator.pushNamed(context,WordDetailPage.routeName,arguments: wordDescription
    );
    }else{
ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Unknown Error'),),);
    }
  }
  convertJsonToList() async {
    allWords = wordsDictionary?.words.entries.map((e) => e.key).toList();
  }
}
