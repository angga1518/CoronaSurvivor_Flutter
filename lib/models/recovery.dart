part of 'models.dart';

class Recovery {
  String nomorRecovery;
  String catatanTambahan;
  String feedback;
  String tanggalKalender;
  String nomorKalender;
  int status;
  //0 belum diisi
  //1 tidak terkoneksi ke puskesmas
  //2 terkoneksi, menunggu balasan
  //3 terkoneksi, sudah dibalas
  String suhuTubuh;
  String saturasi;
  String emailPengguna;
  List<String> listUpdateGejala;
  List<String> listNamaGejala;

  Recovery(
    {
      this.nomorKalender,
      this.suhuTubuh = "",
      this.saturasi = "",
      this.catatanTambahan = "",
      this.tanggalKalender,
      this.emailPengguna,
      this.feedback,
      this.nomorRecovery,
      this.status,
      this.listNamaGejala,
      this.listUpdateGejala
    }
  );
}
