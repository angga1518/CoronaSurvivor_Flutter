part of 'shared.dart';

// local_backend_base_url = "http://localhost:8080/";
// prod_base_url = "https://coronasurvivor.azurewebsites.net/";
// please use http instead of https
// const String base_url = "http://coronasurvivor.azurewebsites.net/";
const String base_url = "http://acf5ca5ce32b.ngrok.io/";

PageEvent prevPageEvent;
CalendarModel sharedCalendar;
CovidIndo sharedCovidIndo;
List<KasusProvinsi> sharedListKasusProvinsi;
String tokenFCM;

// String getTanggalFormatted(String tanggal) {
//   if (!tanggal.contains("T")) {
//     return tanggal;
//   }
//   String yyyyMMdd = tanggal.split("T")[0];
//   List<int> detailDate = yyyyMMdd.split("-").map((e) => int.parse(e)).toList();
//   DateTime date = DateTime(detailDate[0], detailDate[1], detailDate[2]);
//   return DateFormat('dd/MM/yyyy').format(date);
// }

Map<int, String> kodeUrutToProv = {
  1: "Aceh",
  2: "Sumatera Utara",
  3: "Sumatera Barat",
  4: "Riau",
  5: "Jambi",
  6: "Sumatera Selatan",
  7: "Bengkulu",
  8: "Bangka Belitung",
  9: "Lampung",
  10: "Kepulauan Riau",
  11: "DKI Jakarta",
  12: "Jawa Barat",
  13: "Jawa Tengah",
  14: "Daerah Istimewa Yogyakarta",
  15: "Jawa Timur",
  16: "Banten",
  17: "Bali",
  18: "Nusa Tenggara Barat",
  19: "Nusa Tenggara Timur",
  20: "Kalimantan Barat",
  21: "Kalimantan Tengah",
  22: "Kalimantan Selatan",
  23: "Kalimantan Utara",
  24: "Kalimantan Timur",
  25: "Sulawesi Utara",
  26: "Sulawesi Tengah",
  27: "Sulawesi Selatan",
  28: "Sulawesi Tenggara",
  29: "Gorontalo",
  30: "Sulawesi Barat",
  31: "Maluku",
  32: "Maluku Utara",
  33: "Papua",
  34: "Papua Barat",
};

Map<String, int> provToKodeUrut = {
  "Aceh": 1,
  "Sumatera Utara": 2,
  "Sumatera Barat": 3,
  "Riau": 4,
  "Jambi": 5,
  "Sumatera Selatan": 6,
  "Bengkulu": 7,
  "Bangka Belitung": 8,
  "Lampung": 9,
  "Kepulauan Riau": 0,
  "DKI Jakarta": 1,
  "Jawa Barat": 2,
  "Jawa Tengah": 3,
  "Daerah Istimewa Yogyakarta": 4,
  "Jawa Timur": 5,
  "Banten": 6,
  "Bali": 7,
  "Nusa Tenggara Barat": 8,
  "Nusa Tenggara Timur": 9,
  "Kalimantan Barat": 0,
  "Kalimantan Tengah": 1,
  "Kalimantan Selatan": 2,
  "Kalimantan Utara": 3,
  "Kalimantan Timur": 4,
  "Sulawesi Utara": 5,
  "Sulawesi Tengah": 6,
  "Sulawesi Selatan": 7,
  "Sulawesi Tenggara": 8,
  "Gorontalo": 9,
  "Sulawesi Barat": 0,
  "Maluku": 1,
  "Maluku Utara": 2,
  "Papua": 3,
  "Papua Barat": 4,
};
