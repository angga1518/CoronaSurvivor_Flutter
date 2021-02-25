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
