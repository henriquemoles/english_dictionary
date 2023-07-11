import 'dart:convert';
import 'package:english_dictionary/domain/entity/words_entity.dart';

class WordsModel extends Word {
  final String? word;
  final List<ResultsModel>? results;
  final SyllablesModel? syllables;
  final dynamic pronunciation;
  final double? frequency;
  final bool? success;
  final String? message;

  WordsModel(
      {this.word,
      this.results,
      this.syllables,
      this.pronunciation,
      this.frequency,
      this.success,
      this.message});



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'results': results!.map((x) => x?.toMap()).toList(),
      'syllables': syllables?.toMap(),
      'pronunciation': pronunciation,
      'frequency': frequency,
      'success': success,
      'message': message,
    };
  }

  factory WordsModel.fromMap(Map<String, dynamic> map) {
    return WordsModel(
     word: map['word'] != null ? map['word'] as String : null,
     results: map['results'] != null ? List<ResultsModel>.from((map['results'] as List).map<ResultsModel?>((x) => ResultsModel.fromMap(x as Map<String,dynamic>),),) : null,
     syllables: map['syllables'] != null ? SyllablesModel.fromMap(map['syllables'] as Map<String,dynamic>) : null,
     pronunciation:map['pronunciation'] != null && map.toString().contains('all') ? map['pronunciation']['all'] as String : map['pronunciation'] != null ? map['pronunciation'] as String : null,
     frequency: map['frequency'] != null ? map['frequency'] as double : null,
     success: map['success'] != null ? map['success'] as bool : null,
     message: map['message'] != null ? map['message'] as String : null,


    );
  }

  String toJson() => json.encode(toMap());

  factory WordsModel.fromJson(String source) => WordsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ResultsModel extends Results {
  String? definition;
  String? partOfSpeech;
  List<String>? synonyms;
  List<String>? typeOf;
  List<String>? hasTypes;
  List<String>? also;
  List<String>? derivation;
  List<String>? examples;

  ResultsModel(
      {this.definition,
      this.partOfSpeech,
      this.synonyms,
      this.typeOf,
      this.hasTypes,
      this.also,
      this.derivation,
      this.examples});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'definition': definition,
      'partOfSpeech': partOfSpeech,
      'synonyms': synonyms,
      'typeOf': typeOf,
      'hasTypes': hasTypes,
      'also': also,
      'derivation': derivation,
      'examples': examples,
    };
  }

  factory ResultsModel.fromMap(Map<String, dynamic> map) {
    return ResultsModel(
     definition: map['definition'] != null ? map['definition'] as String : null,
     partOfSpeech: map['partOfSpeech'] != null ? map['partOfSpeech'] as String : null,
     synonyms: map['synonyms'] != null ? List<String>.from(map['synonyms'] as List<dynamic>) : null,
     typeOf: map['typeOf'] != null ? List<String>.from(map['typeOf'] as List<dynamic>) : null,
     hasTypes: map['hasTypes'] != null ? List<String>.from(map['hasTypes'] as List<dynamic>) : null,
     also: map['also'] != null ? List<String>.from(map['also'] as List<dynamic>): null,
     derivation: map['derivation'] != null ? List<String>.from(map['derivation'] as List<dynamic>) : null,
     examples: map['examples'] != null ? List<String>.from(map['examples'] as List<dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultsModel.fromJson(String source) => ResultsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SyllablesModel extends Syllables {
  int? count;
  List<String>? list;

  SyllablesModel({this.count, this.list});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'list': list,
    };
  }

  factory SyllablesModel.fromMap(Map<String, dynamic> map) {
    return SyllablesModel(
      count: map['count'] != null ? map['count'] as int : null,
      list: map['list'] != null ? List<String>.from((map['list'] as List<dynamic>)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SyllablesModel.fromJson(String source) => SyllablesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PronunciationModel extends Pronunciation {
  String? all;

  PronunciationModel({this.all});


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

  factory PronunciationModel.fromJson(String source) => PronunciationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
