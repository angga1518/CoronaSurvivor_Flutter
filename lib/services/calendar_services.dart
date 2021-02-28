part of 'services.dart';

class CalendarService {
  static Future<CalendarModel> getCalendarByEmail(String email) async {
    String url = base_url + "getCalendar/" + email;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    data = data['result'];
    if (data == null) {
      return null;
    }
    CalendarModel calendarModel =
        await CalendarService.convertToCalendarModel(data);

    // set gejalamodel
    url = base_url + "getAllGejala/" + email;
    response = await http.Client().get(url);
    data = json.decode(response.body);
    data = data['result'] as List<dynamic>;
    List<GejalaModel> listGejala = [];
    for (var x in data) {
      x = x as Map<String, dynamic>;
      listGejala.add(GejalaModel(x['uuid'], x['namaGejala']));
    }
    calendarModel.listObjectGejala = listGejala;
    return calendarModel;
  }

  static Future<bool> validateKodePuskesmas(String kodePuskesmas) async {
    String url = base_url + "puskesmas/validasi/" + kodePuskesmas;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    int responseCode = data['status'] as int;
    if (responseCode != 200) {
      return false;
    }
    return true;
  }

  static Future<CalendarModel> getColors(CalendarModel calendarModel) async {
    String url = base_url + "getColors/" + calendarModel.nomorKalender;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    Map<String, dynamic> x = data as Map<String, dynamic>;
    calendarModel.red = x['red'];
    calendarModel.yellow = x['yellow'];
    calendarModel.tanggalStartRed = x['startDate'];
    calendarModel.lastDate = x['lastDate'];
    calendarModel.status = x['status'];
    sharedCalendar = calendarModel;
    return calendarModel;
  }

  static Future<String> createCalendar(CalendarModel calendarModel) async {
    String url = base_url + "createCalendar";
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "emailPengguna": calendarModel.pengguna.email,
        "nik": calendarModel.nik,
        "beratBadan": calendarModel.beratBadan,
        "tanggalDibuat": calendarModel.tanggalDibuat,
        "tanggalPositif": calendarModel.tanggalPositif.replaceAll('/', '-'),
        "tanggalMunculGejala":
            calendarModel.tanggalMunculGejala.replaceAll('/', '-')
      }),
    );
    if (response.statusCode != 200) {
      return null;
    }
    var data = json.decode(response.body);
    Map<String, dynamic> x = data as Map<String, dynamic>;
    String nomorKalender = x['nomorKalender'];
    return nomorKalender;
  }

  static Future<bool> connectToKodePuskesmas(
      String kodePuskesmas, String kodeCalendar) async {
    String url = base_url + "connect/$kodeCalendar/$kodePuskesmas";
    http.Response response = await http.Client().get(url);
    var data = response.body;
    if (data == "Success") {
      return true;
    } else {
      return false;
    }
  }

  static Future<CalendarModel> convertToCalendarModel(var data) async {
    Map<String, dynamic> x = data as Map<String, dynamic>;
    return CalendarModel(
      nomorKalender: x['nomorKalender'],
      kodePuskesmas: x['kodePuskesmas'],
      emailPengguna: x['emailPengguna'],
      nik: x['nik'],
      beratBadan: x['beratBadan'],
      red: x['red'],
      yellow: x['yellow'],
      isDelayed: x['isDelayed'],
      allGejalaAwalAdded: x['allGejalaAwalAdded'],
      tanggalDibuat: x['tanggalDibuat'],
      tanggalStartRed: x['startRed'],
      status: x['status'],
      tanggalPositif: x['tanggalPositif'],
      tanggalMunculGejala: x['tanggalMunculGejala'],
      lastDate: x['lastDate'],
      listGejala:
          x['listGejala'] == null ? null : x['listGejala'].cast<String>(),
      listNamaGejala: x['listNamaGejala'] == null
          ? null
          : x['listNamaGejala'].cast<String>(),
      listRecovery:
          x['listRecovery'] == null ? null : x['listRecovery'].cast<String>(),
    );
  }
}
