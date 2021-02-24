part of 'services.dart';

class PenerimaDonorService {
  static Future<List<PenerimaDonor>> getPenerimaDonorByEmail(
      String email) async {
    String url = base_url + "getDataPenerimaDonorByEmail?email=" + email;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    data = data['result'];
    List<PenerimaDonor> listPenerimaDonor =
        await PenerimaDonorService.convertToListPenerimaDonor(data);
    return listPenerimaDonor;
  }

  static Future<List<PenerimaDonor>> convertToListPenerimaDonor(
      var data) async {
    List<dynamic> listResult = data as List<dynamic>;
    List<PenerimaDonor> listPenerimaDonor = [];
    for (var i = 0; i < listResult.length; i++) {
      Map<String, dynamic> x = listResult[i] as Map<String, dynamic>;
      listPenerimaDonor.add(PenerimaDonor(
          idDataPenerimaDonor: x['idDataPenerimaDonor'],
          namaLengkap: x['namaLengkap'],
          jenisKelamin: x['jenisKelamin'],
          golonganDarah: x['golonganDarah'],
          domisili: x['domisili'],
          tanggalLahir: x['tanggalLahir'],
          email: x['email'],
          noTelepon: x['noTelepon'],
          rhesus: x['rhesus'],
          tanggalSimpan: x['tanggalSimpan'],
          tanggalPositif: x['tanggalPositif'],
          tanggalGejala: x['tanggalGejala'],
          beratBadan: x['beratBadan'],
          riwayatPenyakit: x['riwayatPenyakit'] == null
              ? null
              : x['riwayatPenyakit'].cast<String>(),
          gejala: x['gejala'] == null ? null : x['gejala'].cast<String>(),
          catatanTambahan: x['catatanTambahan'],
          emailPendaftar: x['emailPendaftar'],
          nik: x['nik'],
          himself: x['himself']));
    }
    return listPenerimaDonor;
  }

  static Future<void> deletePenerimaDonorById(String idPenerimaDonor) async {
    String url = base_url + "deleteDataPenerimaDonor?idDataPenerimaDonor=$idPenerimaDonor";
    http.Response response = await http.Client().delete(url);
    print(response);
  }
}
