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
}
