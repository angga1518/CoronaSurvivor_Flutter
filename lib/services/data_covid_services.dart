part of 'services.dart';

class CovidInfoService {
  static Future<CovidIndo> getInfoIndo() async {
    String url = "http://api.kawalcorona.com/indonesia";
    http.Response response = await http.Client().get(url);
    if (response.statusCode != 200) {
      // default value
      return CovidIndo(
        sembuh: "1,306,141",
        positif: "1,112,725",
        meninggal: "35,254",
        dirawat: "158,162",
      );
    }
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
