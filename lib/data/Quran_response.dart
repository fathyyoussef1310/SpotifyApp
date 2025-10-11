class QuranResponse {
  QuranResponse({
      this.surahName,
      this.surahNameArabic,
      this.surahNameArabicLong,
      this.surahNameTranslation,
      this.revelationPlace,
      this.totalAyah,});

  QuranResponse.fromJson(dynamic json) {
    surahName = json['surahName'];
    surahNameArabic = json['surahNameArabic'];
    surahNameArabicLong = json['surahNameArabicLong'];
    surahNameTranslation = json['surahNameTranslation'];
    revelationPlace = json['revelationPlace'];
    totalAyah = json['totalAyah'];
  }
  String? surahName;
  String? surahNameArabic;
  String? surahNameArabicLong;
  String? surahNameTranslation;
  String? revelationPlace;
  int? totalAyah;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['surahName'] = surahName;
    map['surahNameArabic'] = surahNameArabic;
    map['surahNameArabicLong'] = surahNameArabicLong;
    map['surahNameTranslation'] = surahNameTranslation;
    map['revelationPlace'] = revelationPlace;
    map['totalAyah'] = totalAyah;
    return map;
  }

}