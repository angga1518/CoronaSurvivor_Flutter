part of 'models.dart';

class PemberiDonor {
  String idDataPemberiDonor;
  String namaLengkap;
  String jenisKelamin;
  String golonganDarah;
  String domisili;
  String noTelepon;
  String email;
  String rhesus;
  String beratBadan;
  String catatanTambahan;
  String tanggalLahir;
  String tanggalSembuh;
  String tanggalSimpan;
  String tanggalInfeksi;
  String emailPendaftar;
  List<String> gejala;
  List<String> riwayatPenyakit;
  bool himself;
  bool melahirkan;
  String nik;

  PemberiDonor({
    @required this.idDataPemberiDonor,
    @required this.namaLengkap,
    @required this.jenisKelamin,
    @required this.golonganDarah,
    @required this.domisili,
    @required this.tanggalLahir,
    @required this.email,
    @required this.noTelepon,
    @required this.rhesus,
    @required this.tanggalSimpan,
    @required this.tanggalInfeksi,
    @required this.tanggalSembuh,
    @required this.beratBadan,
    @required this.riwayatPenyakit,
    @required this.gejala,
    @required this.catatanTambahan,
    @required this.emailPendaftar,
    @required this.nik,
    @required this.himself,
    @required this.melahirkan,
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
