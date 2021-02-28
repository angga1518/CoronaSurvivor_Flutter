part of 'models.dart';

class CovidIndo {
  final String positif;
  final String sembuh;
  final String meninggal;
  final String dirawat;

  CovidIndo(
      {@required this.positif,
      @required this.sembuh,
      @required this.meninggal,
      @required this.dirawat});
}

class KasusProvinsi {
  int kodeUrut;
  String provinsi;
  int positif;
  int sembuh;
  int meninggal;
  KasusProvinsi({
    @required this.kodeUrut,
    @required this.provinsi,
    @required this.positif,
    @required this.sembuh,
    @required this.meninggal,
  });
}
