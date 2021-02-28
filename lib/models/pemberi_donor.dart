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
  String melahirkan;
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

  String formattedGolDarah() {
    return this.golonganDarah + "(" + this.rhesus + ")";
  }

  String formattedGender() {
    return this.jenisKelamin.toLowerCase() == "perempuan" ? "P" : "L";
  }

  String formattedDate(String timestamp) {
    return timestamp.substring(0, 10);
  }

  DateTime generateTanggalSimpan() {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
  }

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
        'tanggalInfeksi': this.tanggalInfeksi.replaceAll('/', '-'),
        'tanggalSembuh': this.tanggalSembuh.replaceAll('/', '-'),
        'tanggalSimpan': generateTanggalSimpan().toString(),
        'beratBadan': this.beratBadan.toString(),
        'riwayatPenyakit': this.riwayatPenyakit,
        'gejala': this.gejala,
        'catatanTambahan': this.catatanTambahan,
        'emailPendaftar': this.emailPendaftar,
        'nik': this.nik,
        'himself': this.himself,
        'melahirkan': this.melahirkan
      };

  String hideAll(String target) {
    int targetLength = target.length;
    String hasilTarget = "";
    for (int i = 0; i < targetLength; i++) {
      hasilTarget += "*";
    }
    return hasilTarget;
  }

  String censor(String target) {
    List<String> targetSplit = target.split(" ");
    String hasil = "";
    for (String word in targetSplit) {
      String first = word[0];
      int sisa = word.length - 1;
      hasil += first;
      for (int a = 0; a < sisa; a++) {
        hasil += "*";
      }
      hasil += " ";
    }
    return hasil;
  }
}
