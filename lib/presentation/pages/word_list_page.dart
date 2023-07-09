import 'package:english_dictionary/presentation/controllers/word_list_page_controller.dart';
import 'package:english_dictionary/src/words_dictionary.dart';
import 'package:flutter/material.dart';

class WordListPage extends StatefulWidget {
  const WordListPage({super.key});

  @override
  State<WordListPage> createState() =>
      _WordListPageState(WordListPageController(WordsDictionary()));
}

class _WordListPageState extends State<WordListPage> {
  final WordListPageController wordListPageController;

  _WordListPageState(this.wordListPageController);

  @override
  void initState() {
    wordListPageController.convertJsonToList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: wordListPageController.allWords?.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                wordListPageController.allWords![index],
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}
