part of 'services.dart';

class CovidInfoService {
  static Future<CovidIndo> getInfoIndo() async {
    String url = "http://api.kawalcorona.com/indonesia";
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body)[0];
    CovidIndo covidIndo = CovidIndo(
      sembuh: data['sembuh'],
      positif: data['positif'],
      meninggal: data['meninggal'],
      dirawat: data['dirawat'],
    );
    return covidIndo;
  }
}
