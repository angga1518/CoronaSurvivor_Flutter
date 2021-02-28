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
  String beratBadan;
  List<String> riwayatPenyakit;
  List<String> gejala;
  String catatanTambahan;
  String emailPendaftar;
  String nik;
  bool himself;

  PenerimaDonor({
    this.idDataPenerimaDonor,
    this.namaLengkap,
    this.jenisKelamin,
    this.golonganDarah,
    this.domisili,
    this.tanggalLahir,
    this.email,
    this.noTelepon,
    this.rhesus,
    this.tanggalSimpan,
    this.tanggalPositif,
    this.tanggalGejala,
    this.beratBadan,
    this.riwayatPenyakit,
    this.gejala,
    this.catatanTambahan,
    this.emailPendaftar,
    this.nik,
    this.himself,
  });

  Map<String, dynamic> toJson() => {
        // 'idDataPenerimaDonor': this.idDataPenerimaDonor,
        'namaLengkap': this.namaLengkap,
        'jenisKelamin': this.jenisKelamin,
        'golonganDarah': this.golonganDarah,
        'domisili': this.domisili,
        'tanggalLahir': this.tanggalLahir.replaceAll('/', '-'),
        'email': this.email,
        'noTelepon': this.noTelepon,
        'rhesus': this.rhesus,
        'tanggalPositif': this.tanggalPositif.replaceAll('/', '-'),
        'tanggalGejala': this.tanggalGejala.replaceAll('/', '-'),
        'tanggalSimpan': generateTanggalSimpan().toString(),
        'beratBadan': this.beratBadan.toString(),
        'riwayatPenyakit': this.riwayatPenyakit,
        'gejala': this.gejala,
        'catatanTambahan': this.catatanTambahan,
        'emailPendaftar': this.emailPendaftar,
        'nik': this.nik,
        'himself': this.himself
      };

  DateTime generateTanggalSimpan() {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
  }

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

  String formattedGolDarah() {
    return this.golonganDarah + "(" + this.rhesus + ")";
  }

  String formattedGender() {
    return this.jenisKelamin.toLowerCase() == "perempuan" ? "P" : "L";
  }

  String formattedDate(String timestamp) {
    return timestamp.substring(0, 10);
  }
}
