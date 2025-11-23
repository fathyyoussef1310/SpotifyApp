
class QuranResponse {
  QuranResponse({
      this.code, 
      this.message, 
      this.data,});

  QuranResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? code;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class AudioFull {
  AudioFull({
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
  });

  AudioFull.fromJson(Map<String, dynamic> json) {
    one = json['01'];
    two = json['02'];
    three = json['03'];
    four = json['04'];
    five = json['05'];
  }

  String? one;
  String? two;
  String? three;
  String? four;
  String? five;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['01'] = one;
    map['02'] = two;
    map['03'] = three;
    map['04'] = four;
    map['05'] = five;
    return map;
  }
}

class Data {
  Data({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
    this.audioFull,});

  Data.fromJson(dynamic json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationType = json['revelationType'];
    audioFull = json['audioFull'] != null ? AudioFull.fromJson(json['audioFull']) : null;
  }
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;
  AudioFull? audioFull;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['name'] = name;
    map['englishName'] = englishName;
    map['englishNameTranslation'] = englishNameTranslation;
    map['numberOfAyahs'] = numberOfAyahs;
    map['revelationType'] = revelationType;
    if (audioFull != null) {
      map['audioFull'] = audioFull?.toJson();
    }
    return map;
  }

}
