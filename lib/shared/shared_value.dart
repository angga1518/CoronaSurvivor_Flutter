part of 'shared.dart';

// local_backend_base_url = "http://localhost:8080/";
// prod_base_url = "https://coronasurvivor.azurewebsites.net/";
// please use http instead of https
// const String base_url = "http://coronasurvivor.azurewebsites.net/";
const String base_url = "http://e9724a7082ac.ngrok.io/";

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
String isIncrementLikeArtikel;

CalendarModel sharedCalendar;
CovidIndo sharedCovidIndo;
