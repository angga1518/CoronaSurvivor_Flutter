part of 'models.dart';

class PenerimaDonor {
  String idDataPenerimaDonor;
  String namaLengkap;
  String jenisKelamin;
  String golonganDarah;
  String domisili;
  String tanggalLahir;
  String email;
  String noTelepon;
  String rhesus;
  String tanggalSimpan;
  String tanggalPositif;
  String tanggalGejala;
  int beratBadan;
  List<String> riwayatPenyakit;
  List<String> gejala;
  String catatanTambahan;
  String emailPendaftar;
  String nik;
  bool himself;

  PenerimaDonor({
    @required this.idDataPenerimaDonor,
    @required this.namaLengkap,
    @required this.jenisKelamin,
    @required this.golonganDarah,
    @required this.domisili,
    @required this.tanggalLahir,
    @required this.email,
    @required this.noTelepon,
    @required this.rhesus,
    @required this.tanggalSimpan,
    @required this.tanggalPositif,
    @required this.tanggalGejala,
    @required this.beratBadan,
    @required this.riwayatPenyakit,
    @required this.gejala,
    @required this.catatanTambahan,
    @required this.emailPendaftar,
    @required this.nik,
    @required this.himself,
  });

  String formattedGejala() {
    String res = "";
    for (var i = 0; i < gejala.length; i++) {
      if (i == gejala.length - 1) {
        res += gejala[i];
        break;
      }
      res += gejala[i] + "\n";
    }
    return res;
  }
  String formattedRiwayatPenyakit() {
    String res = "";
    for (var i = 0; i < riwayatPenyakit.length; i++) {
      if (i == riwayatPenyakit.length - 1) {
        res += riwayatPenyakit[i];
        break;
      }
      res += riwayatPenyakit[i] + "\n";
    }
    return res;
  }
}
