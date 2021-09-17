import 'package:http/http.dart' as http;

class NewsAPIRepository {
  static Future<http.Response> fetchNews() async {
    http.Response response;
    try {
      response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=ab3b6086568c4c00ad6c843bf2aa2cf5"));
    } catch (hata) {
      print(hata);
    }
    
    return response;
  }
}
