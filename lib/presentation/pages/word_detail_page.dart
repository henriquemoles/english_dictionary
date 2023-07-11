import 'package:english_dictionary/infra/models/words_model.dart';
import 'package:flutter/material.dart';

class WordDetailPage extends StatefulWidget {
  const WordDetailPage({super.key,}); 
   static const routeName = '/wordDetailPage';


  @override
  State<WordDetailPage> createState() => _WordDetailPageState();
}

class _WordDetailPageState extends State<WordDetailPage> {

  @override

  Widget build(BuildContext context) {
  final args = ModalRoute.of(context)!.settings.arguments as WordsModel;
    return  Scaffold(
      body:Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(child: Column(children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
              child: Column(children: [
               Center(child: Text(args.word!)),
               SizedBox(height: 12,),
                Center(child: Text(args.results![0].definition!)),
                      ]),
            ),)
        ]),),
      ));
  }
}
