import 'package:http/http.dart' as http;

class NewsAPIRepository {
  static Future<http.Response> fetchNews() async {
    http.Response response;
    try {
      response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=tr&apiKey=53d75c461d0c45de8ccb4813c3c050dc"));
    } catch (hata) {
      print(hata);
    }
    
    return response;
  }
}
