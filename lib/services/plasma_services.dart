part of 'services.dart';

class PlasmaServices {
  static Future<List<DataPenerima>> getAllSavedDataPenerima() async {
    String url = base_url + "getAllDataPenerimaDonor";
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    data = data['result'];
    List<DataPenerima> listDataPenerima =
        await PlasmaServices.convertToListDataPenerima(data);
    return listDataPenerima;
  }

  static Future<List<DataPenerima>> convertToListDataPenerima(var data) async {
    List<dynamic> listResult = data as List<dynamic>;
    List<DataPenerima> listDataPenerima = [];
    for (var i = 0; i < listResult.length; i++) {
      Map<String, dynamic> x = listResult[i] as Map<String, dynamic>;
      int beratBadan = x['beratBadan'];
      String catatanTambahan = x['catatanTambahan'];
      String domisili = x['domisili'];
      String email = x['email'];
      String emailPendaftar = x['emailPendaftar'];
      List<dynamic> listGejala = x['listGejala'];
      String golDarah = x['golonganDarah'];
      String rhesus = x['rhesus'];
      String jenisKelamin = x['jenisKelamin'];
      String namaLengkap = x['namaLengkap'];
      String nik = x['nik'];
      String noTelepon = x['noTelepon'];
      List<dynamic> listRiwayatPenyakit = x['riwayatPenyakit'];
      String tanggalGejala = x['tanggalGejala'];
      String tanggalLahir = x['tanggalLahir'];
      String tanggalPositif = x['tanggalPositif'];
      String tanggalDisimpan = x['tanggalDisimpan'];

      DataPenerima dataPenerima = new DataPenerima(
          beratBadan: beratBadan,
          catatanTambahan: catatanTambahan,
          domisili: domisili,
          email: email,
          emailPendaftar: emailPendaftar,
          golDarah: golDarah,
          rhesus: rhesus,
          jenisKelamin: jenisKelamin,
          namaLengkap: namaLengkap,
          nik: nik,
          noTelepon: noTelepon,
          tanggalLahir: tanggalLahir,
          tanggalPositif: tanggalPositif,
          tanggalDisimpan: tanggalDisimpan,
          listGejala: listGejala,
          listRiwayatPenyakit: listRiwayatPenyakit,
          tanggalGejala: tanggalGejala);

      listDataPenerima.add(dataPenerima);
      return listDataPenerima;
    }
  }
}
