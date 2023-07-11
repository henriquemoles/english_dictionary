class Word {
 final String? word;
 final List<Results>? results;
 final Syllables? syllables;
 final dynamic pronunciation;
 final double? frequency;
final bool? success;
 final String? message;

  Word({
    this.word,
    this.results,
    this.syllables,
    this.pronunciation,
    this.frequency,
    this.success,
    this.message,
  });
}

class Results {
  String? definition;
  String? partOfSpeech;
  List<String>? synonyms;
  List<String>? typeOf;
  List<String>? hasTypes;
  List<String>? also;
  List<String>? derivation;
  List<String>? examples;

  Results(
      {this.definition,
      this.partOfSpeech,
      this.synonyms,
      this.typeOf,
      this.hasTypes,
      this.also,
      this.derivation,
      this.examples});

}

class Syllables {
 final int? count;
 final List<String>? list;

  Syllables({this.count, this.list});
}

class Pronunciation {
 final String? all;

  Pronunciation({this.all});
}