part of 'models.dart';

class Komentar {
  String idKomentar;
  String namaLengkap;
  String tanggalPost;
  String isi;
  int jumlahLike;
  List<Reply> replies;
  bool isLiked;

  Komentar(
      {this.idKomentar,
      this.namaLengkap,
      this.tanggalPost,
      this.isi,
      this.jumlahLike,
      this.replies,
      this.isLiked});

  @override
  String toString() {
    return "[$idKomentar] - $isi";
  }

    String getTanggal() {
    if (!tanggalPost.contains("T")) {
      return tanggalPost;
    }
    String yyyyMMdd = this.tanggalPost.split("T")[0];
    List<int> detailDate =
        yyyyMMdd.split("-").map((e) => int.parse(e)).toList();
    DateTime date = DateTime(detailDate[0], detailDate[1], detailDate[2]);
    return DateFormat('dd/MM/yyyy').format(date);
  }
}

