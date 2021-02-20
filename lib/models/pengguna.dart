part of 'models.dart';

class Pengguna {
  String email;
  String namaLengkap;
  String tanggalLahir;
  String jenisKelamin;
  String domisili;
  String noTelepon;
  List<String> listIdArtikelDisimpan;
  List<String> listIdLikedArtikel;
  List<String> listIdLikedKomentar;

  Pengguna({
    @required this.namaLengkap,
    @required this.email,
    @required this.tanggalLahir,
    @required this.jenisKelamin,
    @required this.domisili,
    @required this.noTelepon,
    this.listIdArtikelDisimpan,
    this.listIdLikedArtikel,
    this.listIdLikedKomentar,
  });

  Pengguna copyWith(
          {List<String> listIdArtikelDisimpan,
          List<String> listIdLikedArtikel,
          List<String> listIdLikedKomentar}) =>
      Pengguna(
          namaLengkap: this.namaLengkap,
          email: this.email,
          tanggalLahir: this.tanggalLahir,
          jenisKelamin: this.jenisKelamin,
          domisili: this.domisili,
          noTelepon: this.noTelepon,
          listIdArtikelDisimpan: listIdArtikelDisimpan,
          listIdLikedArtikel: listIdLikedArtikel,
          listIdLikedKomentar: listIdLikedKomentar);

  @override
  String toString() {
    return "[$namaLengkap] - $email";
  }

  String getTanggalLahir() {
    if (!tanggalLahir.contains("T")) {
      return tanggalLahir;
    }
    String yyyyMMdd = this.tanggalLahir.split("T")[0];
    List<int> detailDate =
        yyyyMMdd.split("-").map((e) => int.parse(e)).toList();
    DateTime date = DateTime(detailDate[0], detailDate[1], detailDate[2]);
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
