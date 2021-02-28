part of 'shared.dart';

String getTanggalForUI(String tanggalPost) {
  if (!tanggalPost.contains("T")) {
    return tanggalPost;
  }
  String yyyyMMdd = tanggalPost.split("T")[0];
  List<int> detailDate = yyyyMMdd.split("-").map((e) => int.parse(e)).toList();
  DateTime date = DateTime(detailDate[0], detailDate[1], detailDate[2]);
  return DateFormat('dd/MM/yyyy').format(date);
}

bool tanggalValidation(String tanggal) {
  List<String> details = tanggal.split("/");
  if (details.length != 3) {
    return false;
  }
  if (details[0].length != 4) {
    return false;
  }
  if (details[1].length != 2) {
    return false;
  }
  if (details[2].length != 2) {
    return false;
  }
  try {
    int y = int.parse(details[0]);
    int m = int.parse(details[1]);
    int d = int.parse(details[2]);
    if (y > 2022) {
      return false;
    }
    if (m > 12) {
      return false;
    }
    if (d > 31) {
      return false;
    }
  } catch (e) {
    return false;
  }
  return true;
}

String getTanggalFormatted(String tanggal) {
  if (!tanggal.contains("T")) {
    return tanggal;
  }
  String yyyyMMdd = tanggal.split("T")[0];
  List<int> detailDate = [];
  if (tanggal.contains("-")) {
    // yyyy-mm-dd
    if (yyyyMMdd.split("-")[0].length == 4) {
      detailDate = yyyyMMdd.split("-").map((e) => int.parse(e)).toList();
    } else {
      detailDate =
          yyyyMMdd.split("-").map((e) => int.parse(e)).toList().reversed;
    }
  } else {
    if (yyyyMMdd.split("/")[0].length == 4) {
      detailDate = yyyyMMdd.split("/").map((e) => int.parse(e)).toList();
    } else {
      List<int> temp = yyyyMMdd.split("/").map((e) => int.parse(e)).toList();
      for (int x in temp) {
        detailDate.insert(0, x);
      }
    }
  }
  DateTime date = DateTime(detailDate[0], detailDate[1], detailDate[2]);
  return DateFormat('dd/MM/yyyy').format(date);
}

// from dd/MM/yyyy
DateTime getDateTimeFromStringTanggal(String tanggal) {
  if (!tanggal.contains("T")) {
    tanggal = tanggal + "T";
  }
  String temp = getTanggalFormatted(tanggal);
  DateTime result = DateTime(int.parse(temp.split("/")[2]),
      int.parse(temp.split("/")[1]), int.parse(temp.split("/")[0]));
  return result;
}

// to yyyy-MM-dd
String getTanggalFromDateTime(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime);
}

// from yyyy-MM-dd
String convertToDDMMYYY(String tanggal) {
  List<String> res = tanggal.split("-");
  return "${res[2]}-${res[1]}-${res[0]}";
}
