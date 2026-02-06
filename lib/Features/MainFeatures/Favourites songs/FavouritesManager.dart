import 'package:flutter/cupertino.dart';
import 'package:spotifyyapp/data/QuranResponse.dart';

class Favouritesmanager extends ChangeNotifier {
  bool fav = false;
  List<Data>FavQuran = [];

  List<Data> get Favq => FavQuran;

  void toggleData(Data Sora) {
    int index = FavQuran.indexWhere((item) => item.englishName == Sora.englishName);
    if (index != -1) {
      FavQuran.removeAt(index);
    } else {
      FavQuran.add(Sora);
    }
    notifyListeners();
  }

  bool isExisted(Data sora) {
    return FavQuran.any((item) => item.englishName == sora.englishName);
  }
}