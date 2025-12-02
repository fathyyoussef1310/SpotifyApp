import 'dart:convert';
import 'package:http/http.dart' as http;
import 'QuranResponse.dart';
import 'Radio_responses.dart';
class UserRepo {
  Future<QuranResponse> fetchData() async {
    final url = Uri.parse("https://equran.id/api/en/surah");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final ress=jsonDecode(response.body);
      return QuranResponse.fromJson(ress);
    }
    else
    {
      throw Exception("Error fetching data: ${response.statusCode}");
    }
  }
  Future<RadioResponses>fetchRadioStation()async{
    final uri=Uri.parse("https://www.mp3quran.net/api/v3/radios?language=ar");
    final response= await http.get(uri);
    if(response.statusCode==200){
      final respond= jsonDecode(response.body);
      return RadioResponses.fromJson(respond);
    }else {
       throw Exception("Error in FetchingData");
    }
  }

}
