part of 'models.dart';

class CalendarModel {
  String nomorKalender;
  String kodePuskesmas;
  String emailPengguna;
  List<String> listGejala;
  List<String> listRiwayat;
  String nik;
  int beratBadan;
  int red;
  int yellow;
  bool isDelayed;
  bool allGejalaAwalAdded;
  String tanggalDibuat;
  String tanggalStartRed;
  int status;
  List<String> listRecovery;
  String tanggalPositif;
  String tanggalMunculGejala;
  String lastDate;
  Pengguna pengguna;

  CalendarModel({
    this.nomorKalender,
    this.kodePuskesmas,
    this.emailPengguna,
    this.listGejala,
    this.listRiwayat,
    this.nik,
    this.beratBadan,
    this.red,
    this.yellow,
    this.isDelayed,
    this.allGejalaAwalAdded,
    this.tanggalDibuat,
    this.tanggalStartRed,
    this.status,
    this.listRecovery,
    this.tanggalPositif,
    this.tanggalMunculGejala,
    this.lastDate,
    this.pengguna
  });
}
