class Word {
  String? word;
  List<Results>? results;
  Syllables? syllables;
  Pronunciation? pronunciation;
  double? frequency;

  Word(
      {this.word,
      this.results,
      this.syllables,
      this.pronunciation,
      this.frequency});
}

class Results {
  String? definition;
  String? partOfSpeech;
  List<String>? synonyms;
  List<String>? typeOf;
  List<String>? memberOf;
  List<String>? hasTypes;
  List<String>? partOf;

  Results(
      {this.definition,
      this.partOfSpeech,
      this.synonyms,
      this.typeOf,
      this.memberOf,
      this.hasTypes,
      this.partOf});

}

class Syllables {
  int? count;
  List<String>? list;

  Syllables({this.count, this.list});
}

class Pronunciation {
  String? all;

  Pronunciation({this.all});
}