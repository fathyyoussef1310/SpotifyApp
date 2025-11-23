import 'dart:convert';
import 'package:http/http.dart' as http;
import 'QuranResponse.dart';
class UserRepo {
  Future<QuranResponse> fetchData() async {
    final url = Uri.parse("https://equran.id/api/en/surah");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final ress=jsonDecode(response.body);
      return QuranResponse.fromJson(ress);
    } else {
      throw Exception("Error fetching data: ${response.statusCode}");
    }
  }
}
