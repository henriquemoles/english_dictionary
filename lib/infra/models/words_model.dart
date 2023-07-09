// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:english_dictionary/domain/entity/words_entity.dart';

class WordsModel extends Word {
  final String? word;
  final List<ResultsModel>? results;
  final SyllablesModel? syllables;
  final PronunciationModel? pronunciation;
  final double? frequency;

  WordsModel({
    this.word,
    this.results,
    this.syllables,
    this.pronunciation,
    this.frequency,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'results': results?.map((x) => x.toMap()).toList(),
      'syllables': syllables?.toMap(),
      'pronunciation': pronunciation?.toMap(),
      'frequency': frequency,
    };
  }

  factory WordsModel.fromMap(Map<String, dynamic> map) {
    return WordsModel(
      word: map['word'] != null ? map['word'] as String : null,
      results: map['results'] != null
          ? List<ResultsModel>.from(
              (map['results'] as List<int>).map<ResultsModel?>(
                (x) => ResultsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      syllables: map['syllables'] != null
          ? SyllablesModel.fromMap(map['syllables'] as Map<String, dynamic>)
          : null,
      pronunciation: map['pronunciation'] != null
          ? PronunciationModel.fromMap(
              map['pronunciation'] as Map<String, dynamic>)
          : null,
      frequency: map['frequency'] != null ? map['frequency'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WordsModel.fromJson(String source) =>
      WordsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ResultsModel extends Results {
  final String? definition;
  final String? partOfSpeech;
  final List<String>? synonyms;
  final List<String>? typeOf;
  final List<String>? memberOf;
  final List<String>? hasTypes;
  final List<String>? partOf;

  ResultsModel(
      {this.definition,
      this.partOfSpeech,
      this.synonyms,
      this.typeOf,
      this.memberOf,
      this.hasTypes,
      this.partOf});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'definition': definition,
      'partOfSpeech': partOfSpeech,
      'synonyms': synonyms,
      'typeOf': typeOf,
      'memberOf': memberOf,
      'hasTypes': hasTypes,
      'partOf': partOf,
    };
  }

  factory ResultsModel.fromMap(Map<String, dynamic> map) {
    return ResultsModel(
      definition:
          map['definition'] != null ? map['definition'] as String : null,
      partOfSpeech:
          map['partOfSpeech'] != null ? map['partOfSpeech'] as String : null,
      synonyms: map['synonyms'] != null
          ? List<String>.from((map['synonyms'] as List<String>))
          : null,
      typeOf: map['typeOf'] != null
          ? List<String>.from((map['typeOf'] as List<String>))
          : null,
      memberOf: map['memberOf'] != null
          ? List<String>.from((map['memberOf'] as List<String>))
          : null,
      hasTypes: map['hasTypes'] != null
          ? List<String>.from((map['hasTypes'] as List<String>))
          : null,
      partOf: map['partOf'] != null
          ? List<String>.from((map['partOf'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultsModel.fromJson(String source) =>
      ResultsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SyllablesModel extends Syllables {
  final int? count;
  final List<String>? list;

  SyllablesModel({
    this.count,
    this.list,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'list': list,
    };
  }

  factory SyllablesModel.fromMap(Map<String, dynamic> map) {
    return SyllablesModel(
      count: map['count'] != null ? map['count'] as int : null,
      list: map['list'] != null
          ? List<String>.from((map['list'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SyllablesModel.fromJson(String source) =>
      SyllablesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PronunciationModel extends Pronunciation {
  final String? all;

  PronunciationModel({
    this.all,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'all': all,
    };
  }

  factory PronunciationModel.fromMap(Map<String, dynamic> map) {
    return PronunciationModel(
      all: map['all'] != null ? map['all'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PronunciationModel.fromJson(String source) =>
      PronunciationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
