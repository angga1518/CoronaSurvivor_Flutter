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

  static Future<List<KasusProvinsi>> getInfoProvinsi() async {
    String url =
        "https://services5.arcgis.com/VS6HdKS0VfIhv8Ct/arcgis/rest/services/COVID19_Indonesia_per_Provinsi/FeatureServer/0/query?where=1%3D1&outFields=Kode_Provi,Provinsi,Kasus_Posi,Kasus_Semb,Kasus_Meni&outSR=4326&f=json";
      http.Response response =
          await http.Client().get(url);
      var data = json.decode(response.body);
      data = data['features'] as List<dynamic>;
      List<KasusProvinsi> listKasusProvinsi = [];
      for (var i = 0; i < data.length-1; i++) {
        Map<String, dynamic> x = data[i];
        Map<String, dynamic> y = x["attributes"];
        listKasusProvinsi.add(KasusProvinsi(
          kodeUrut: i + 1,
          provinsi: y['Provinsi'],
          positif: y['Kasus_Posi'],
          sembuh: y['Kasus_Semb'],
          meninggal: y['Kasus_Meni'],
        ));
      }
      return listKasusProvinsi;
  }
}
