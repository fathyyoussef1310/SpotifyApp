import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Quran_response.dart';
class UserRepo {
  Future<List<QuranResponse>> fetchData() async {
    final url = Uri.parse("https://quranapi.pages.dev/api/surah.json");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => QuranResponse.fromJson(json)).toList();
    } else {
      throw Exception("Error fetching data");
    }
  }
}
