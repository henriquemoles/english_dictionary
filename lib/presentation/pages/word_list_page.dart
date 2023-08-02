import 'package:english_dictionary/core/service/http_service.dart';
import 'package:english_dictionary/domain/entity/words_entity.dart';
import 'package:english_dictionary/domain/use_case/get_word_use_case_impl.dart';
import 'package:english_dictionary/infra/datasources/words_datasource_impl.dart';
import 'package:english_dictionary/infra/repositories/words_repository_impl.dart';
import 'package:english_dictionary/presentation/controllers/word_list_page_controller.dart';
import 'package:english_dictionary/src/words_dictionary.dart';
import 'package:flutter/material.dart';

class WordListPage extends StatefulWidget {
  const WordListPage({super.key});

  @override
  State<WordListPage> createState() => _WordListPageState(
        WordListPageController(
          searchController: TextEditingController(),
          wordsDictionary: WordsDictionary(),
          wordDescription: Word(),
          getWordUseCase: GetWordUseCaseImpl(
            wordsRepository: WordsRepositoryImpl(
              WordsDataSourceImpl(
                httpService: HttpService(),
              ),
            ),
          ),
        ),
      );
}

class _WordListPageState extends State<WordListPage> {
  final WordListPageController wordListPageController;

  _WordListPageState(
    this.wordListPageController,
  );

  @override
  void initState() {
    wordListPageController.convertJsonToList();
    wordListPageController.getData();
    super.initState();
    wordListPageController.finalListWords = wordListPageController.allWords!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              const SizedBox(
                width: 96,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Word List'),
                  ],
                ),
              ),
              Expanded(
                child: TextField(
                  controller: wordListPageController.searchController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Word',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.blue))),
                  onChanged: (text) {
                    wordListPageController.searchBook(text);
                    setState(() {
                      wordListPageController.finalListWords =
                          wordListPageController.suggestion;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: wordListPageController.finalListWords.length,
          itemBuilder: (context, index) {
            final words = wordListPageController.finalListWords[index];
            return Card(
              child: ListTile(
                onTap: () async {
                  // wordListPageController.makeRequest();
                  await wordListPageController.call(words, context);
                },
                title: Text(
                  words,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
