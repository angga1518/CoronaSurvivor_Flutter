part of 'services.dart';

class CovidInfoService {
  static Future<CovidIndo> getInfoIndo() async {
    String url = "http://api.kawalcorona.com/indonesia";
    try {
      http.Response response =
          await http.Client().get(url).timeout(Duration(seconds: 5));
      var data = json.decode(response.body)[0];
      CovidIndo covidIndo = CovidIndo(
        sembuh: data['sembuh'],
        positif: data['positif'],
        meninggal: data['meninggal'],
        dirawat: data['dirawat'],
      );
      return covidIndo;
    } catch (e) {
      // default value
      return CovidIndo(
        positif: "1,322,866",
        sembuh: "1,128,672",
        meninggal: "35,786",
        dirawat: "158,408",
      );
    }
  }
}
