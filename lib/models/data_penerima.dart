part of 'models.dart';

class DataPenerima {
  int beratBadan;
  String catatanTambahan;
  String domisili;
  String email;
  String emailPendaftar;
  List<String> listGejala;
  String golDarah;
  String rhesus;
  String jenisKelamin;
  String namaLengkap;
  String nik;
  String noTelepon;
  List<String> listRiwayatPenyakit;
  String tanggalGejala;
  String tanggalLahir;
  String tanggalPositif;
  String tanggalDisimpan;
  String id;

  DataPenerima(
      {@required this.beratBadan,
      @required this.catatanTambahan,
      @required this.domisili,
      @required this.email,
      @required this.emailPendaftar,
      @required this.golDarah,
      @required this.rhesus,
      @required this.jenisKelamin,
      @required this.namaLengkap,
      @required this.nik,
      @required this.noTelepon,
      this.tanggalGejala,
      @required this.tanggalLahir,
      @required this.tanggalPositif,
      @required this.tanggalDisimpan,
      this.listGejala,
      this.listRiwayatPenyakit,
      @required this.id});

  String getStringGolDarah() {
    return this.golDarah + "(" + this.rhesus + ")";
  }
}
