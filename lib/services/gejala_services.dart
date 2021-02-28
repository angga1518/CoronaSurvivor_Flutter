part of 'services.dart';

class GejalaService {
  static Future<void> savePengguna(Pengguna pengguna) async {}

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
    if (response.statusCode != 200) {
      return null;
    }
    var data = json.decode(response.body);
    Map<String, dynamic> x = data as Map<String, dynamic>;
    calendar.red = x['red'];
    calendar.yellow = x['yellow'];
    calendar.tanggalStartRed = x['startDate'];
    calendar.lastDate = x['lastDate'];
    calendar.status = x['status'];
    sharedCalendar = calendar;
    return calendar;
  }

  static Future<CalendarModel> createTambahanGejala(CalendarModel calendar, List<String> listNamaGejala) async {
    String url = base_url + "createGejala";
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "listNamaGejala": listNamaGejala,
        "emailPengguna": calendar.pengguna.email,
        "nomorKalender": calendar.nomorKalender,
        "tanggalDibuat": getTanggalFromDateTime(DateTime.now())
      }),
    );
    if (response.statusCode != 200) {
      return null;
    }
    var data = json.decode(response.body);
    Map<String, dynamic> x = data as Map<String, dynamic>;
    calendar.red = x['red'];
    calendar.yellow = x['yellow'];
    calendar.tanggalStartRed = x['startDate'];
    calendar.lastDate = x['lastDate'];

    // set gejalamodel
    url = base_url + "getAllGejala/" + calendar.emailPengguna;
    response = await http.Client().get(url);
    data = json.decode(response.body);
    data = data['result'] as List<dynamic>;
    List<GejalaModel> listGejala = [];
    List<String> listNamaGejalaFix = [];
    List<String> listUuidGejalaFix = [];
    for (var x in data) {
      x = x as Map<String, dynamic>;
      listNamaGejalaFix.add(x['namaGejala']);
      listUuidGejalaFix.add(x['uuid']);
      listGejala.add(GejalaModel(x['uuid'], x['namaGejala']));
    }
    calendar.listObjectGejala = listGejala;
    calendar.listGejala = listUuidGejalaFix;
    calendar.listNamaGejala = listNamaGejalaFix;
    return calendar;
  }

  static Future<void> updateGejala(List<UpdateGejalaModel> listUpdate, String nomorCalendar, String date) async {
    String url = base_url + "updateGejalaFromRecovery/$nomorCalendar";
    List<Map<String,String>> update = [];
    for (UpdateGejalaModel gejala in listUpdate) {
      Map<String,String> x = {};
      x['uuid'] = gejala.uuid;
      x['update'] = gejala.update;
      x['date'] = convertToDDMMYYY(date);
      update.add(x);
    }
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "list": update,
      }),
    );
    print("x");
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
