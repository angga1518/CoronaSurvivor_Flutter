part of 'extensions.dart';

extension FirebaseExtension on User {
  Pengguna convertToPengguna({
    @required String namaLengkap,
    @required String tanggalLahir,
    @required String jenisKelamin,
    @required String domisili,
    @required String noTelepon,
  }) =>
      Pengguna(
          namaLengkap: namaLengkap,
          email: this.email,
          tanggalLahir: tanggalLahir,
          jenisKelamin: jenisKelamin,
          domisili: domisili,
          noTelepon: noTelepon,
          listIdArtikelDisimpan: null,
          listIdLikedArtikel: null,
          listIdLikedKomentar: null);

  Future<Pengguna> fromFirebase() async =>
      await PenggunaServices.getPengguna(this.email);
}
