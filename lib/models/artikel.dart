part of 'models.dart';

class Artikel {
  String author;
  String institusi;
  String deskripsi;
  String judul;
  String idArtikel;
  String tanggalPost;
  int jumlahView;
  int jumlahLike;
  List<String> listIdComment;
  String imageUrl;
  bool isLiked;

  Artikel({
    @required this.author,
    @required this.idArtikel,
    @required this.institusi,
    @required this.deskripsi,
    @required this.judul,
    @required this.tanggalPost,
    @required this.jumlahLike,
    @required this.jumlahView,
    @required this.imageUrl,
    @required this.isLiked,
    this.listIdComment,
  });

  @override
  String toString() {
    return "[$idArtikel] - $judul";
  }

  String getTanggalPost() {
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
