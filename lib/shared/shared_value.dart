part of 'shared.dart';

// local_backend_base_url = "http://localhost:8080/";
// prod_base_url = "https://coronasurvivor.azurewebsites.net/";
// please use http instead of https
// const String base_url = "http://coronasurvivor.azurewebsites.net/";
const String base_url = "http://2ff2b0915f0d.ngrok.io/";

PageEvent prevPageEvent;
List<Komentar> sharedListKomentar;
Map<String, List<Komentar>> mapIdArtikelKeKomentar = {};
Map<String, bool> mapStatusLikedKomentar = {};
Map<String, int> mapJumlahLikedKomentar = {};
Map<String, bool> mapForPostLikeKomentar = {};
bool isLikedIconArtikel;
int jumlahLikeArtikelFrontEnd;
String isStateLikeArtikel;
String isStateLikeKomentar;
List<Artikel> listSharedSavedArtikel;
List<Artikel> listSharedAllArtikel;

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
