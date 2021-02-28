part of 'services.dart';

class RecoveryService {
  static Future<Recovery> createRecovery(Recovery recovery) async {
    String url = base_url + "createRecovery";
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "catatanTambahan": recovery.catatanTambahan,
        "tanggalKalender": recovery.tanggalKalender,
        "nomorKalender": recovery.nomorKalender,
        "suhuTubuh": recovery.suhuTubuh,
        "saturasi": recovery.saturasi,
        "emailPengguna": recovery.emailPengguna,
      }),
    );
    if (response.statusCode != 200) {
      return null;
    }
    var data = json.decode(response.body);
    Map<String, dynamic> x = data as Map<String, dynamic>;
    recovery.nomorRecovery = x['nomorRecovery']; 
    recovery.feedback = x['feedback'];
    recovery.status = x['status'];
    return recovery;
  }

  // dd-MM-yyyy
  static Future<Recovery> getRecovery(String noCalendar, String date) async {
    date = convertToDDMMYYY(date);
    String url = base_url + "getRecovery/$noCalendar/$date";
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    // TODO: add updated gejala
    data = data['recovery'];
    Map<String, dynamic> x = data as Map<String, dynamic>;
    Recovery recovery;
    recovery.nomorRecovery = x['nomorRecovery']; 
    recovery.feedback = x['feedback'];
    recovery.catatanTambahan = x['catatanTambahan'];
    recovery.tanggalKalender = x['tanggalKalender'];
    recovery.nomorKalender = x['nomorKalender'];
    recovery.status = x['status'];
    recovery.suhuTubuh = ""+x['suhuTubuh'];
    recovery.saturasi = ""+x['saturasi'];
    recovery.emailPengguna = x['emailPengguna'];
    return recovery;
  }


  // static Future<Recovery> convertToRecoveryModel(var data) async {
  //   Map<String, dynamic> x = data as Map<String, dynamic>;
  // }
}