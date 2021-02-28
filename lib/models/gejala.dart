part of 'models.dart';

class GejalaModel {
  String uuid;
  String namaGejala;
  GejalaModel(this.uuid, this.namaGejala);
}

class UpdateGejalaModel {
  String uuid;
  String namaGejala;
  String update;
  String date;
  UpdateGejalaModel({this.update, namaGejala, this.date, this.uuid});
}
