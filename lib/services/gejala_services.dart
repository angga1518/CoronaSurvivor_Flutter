part of 'services.dart';

class GejalaService {
  static Future<void> savePengguna(Pengguna pengguna) async {
    
  }

  static Future<CalendarModel> createGejala(CalendarModel calendar) async {
    String url = base_url + "createGejala";
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "listNamaGejala": calendar.listGejala,
        "emailPengguna": calendar.pengguna.email,
        "nomorKalender": calendar.nomorKalender,
        "tanggalDibuat": calendar.tanggalDibuat
      }),
    );
    if(response.statusCode!=200){
      return null;
    }
    var data = json.decode(response.body);
    Map<String, dynamic> x = data as Map<String, dynamic>;
    calendar.red = x['red'];
    calendar.yellow = x['red'];
    calendar.tanggalStartRed = x['startDate'];
    calendar.lastDate = x['red'];
    return calendar;
  }


  // static Future<CalendarModel> convertToCalendarModel(var data) async {
  //   Map<String, dynamic> x = data as Map<String, dynamic>;
  //   return CalendarModel(
  //     nomorKalender: x['nomorKalender'],
  //     kodePuskesmas: x['kodePuskesmas'],
  //     emailPengguna: x['emailPengguna'],
  //     nik: x['nik'],
  //     beratBadan: x['beratBadan'],
  //     red: x['red'],
  //     yellow: x['yellow'],
  //     isDelayed: x['isDelayed'],
  //     allGejalaAwalAdded: x['allGejalaAwalAdded'],
  //     tanggalDibuat: x['tanggalDibuat'],
  //     tanggalStartRed: x['startRed'],
  //     status: x['status'],
  //     tanggalPositif: x['tanggalPositif'],
  //     tanggalMunculGejala: x['tanggalMunculGejala'],
  //     lastDate: x['lastDate'],
  //     listGejala:
  //         x['listGejala'] == null ? null : x['listGejala'].cast<String>(),
  //     listRecovery:
  //         x['listRecovery'] == null ? null : x['listRecovery'].cast<String>(),
  //   );
  // }
}
