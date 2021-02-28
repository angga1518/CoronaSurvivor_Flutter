part of 'shared.dart';

// local_backend_base_url = "http://localhost:8080/";
// prod_base_url = "https://coronasurvivor.azurewebsites.net/";
// please use http instead of https
// const String base_url = "http://coronasurvivor.azurewebsites.net/";
const String base_url = "http://acf5ca5ce32b.ngrok.io/";

PageEvent prevPageEvent;
CalendarModel sharedCalendar;
CovidIndo sharedCovidIndo;

String getTanggalFormatted(String tanggal) {
  if (!tanggal.contains("T")) {
    return tanggal;
  }
  String yyyyMMdd = tanggal.split("T")[0];
  List<int> detailDate = yyyyMMdd.split("-").map((e) => int.parse(e)).toList();
  DateTime date = DateTime(detailDate[0], detailDate[1], detailDate[2]);
  return DateFormat('dd/MM/yyyy').format(date);
}
