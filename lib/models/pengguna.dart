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
}
