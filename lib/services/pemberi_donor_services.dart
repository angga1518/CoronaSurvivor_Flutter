part of 'services.dart';

class PemberiDonorService {
  static Future<List<PemberiDonor>> getPemberiDonorByEmail(String email) async {
    String url = base_url + "getDataPemberiDonorByEmail?email=" + email;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    data = data['result'];
    List<PemberiDonor> listPemberiDonor =
        await PemberiDonorService.convertToListPemberiDonor(data);
    return listPemberiDonor;
  }

  static Future<List<PemberiDonor>> getAllSavedDataPendonor() async {
    String url = base_url + "getAllDataPemberiDonor";
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    data = data['result'];
    List<PemberiDonor> listDataPenerima =
        await PemberiDonorService.convertToListPemberiDonor(data);
    return listDataPenerima;
  }

  static Future<PemberiDonor> convertToPemberiDonor(var x) async {
    return PemberiDonor(
        idDataPemberiDonor: x['idDataPemberiDonor'],
        namaLengkap: x['namaLengkap'],
        jenisKelamin: x['jenisKelamin'],
        golonganDarah: x['golonganDarah'],
        domisili: x['domisili'],
        tanggalLahir: x['tanggalLahir'],
        email: x['email'],
        noTelepon: x['noTelepon'],
        rhesus: x['rhesus'],
        tanggalSimpan: x['tanggalSimpan'],
        tanggalInfeksi: x['tanggalInfeksi'],
        tanggalSembuh: x['tanggalSembuh'],
        beratBadan: x['beratBadan'],
        riwayatPenyakit: x['riwayatPenyakit'] == null
            ? null
            : x['riwayatPenyakit'].cast<String>(),
        gejala: x['gejala'] == null ? null : x['gejala'].cast<String>(),
        catatanTambahan: x['catatanTambahan'],
        emailPendaftar: x['emailPendaftar'],
        nik: x['nik'],
        himself: x['himself'],
        melahirkan: x['melahirkan']);
  }

  static Future<List<PemberiDonor>> convertToListPemberiDonor(var data) async {
    List<dynamic> listResult = data as List<dynamic>;
    List<PemberiDonor> listPemberiDonor = [];
    for (var i = 0; i < listResult.length; i++) {
      Map<String, dynamic> x = listResult[i] as Map<String, dynamic>;
      listPemberiDonor.add(PemberiDonor(
          idDataPemberiDonor: x['idDataPemberiDonor'],
          namaLengkap: x['namaLengkap'],
          jenisKelamin: x['jenisKelamin'],
          golonganDarah: x['golonganDarah'],
          domisili: x['domisili'],
          tanggalLahir: x['tanggalLahir'],
          email: x['email'],
          noTelepon: x['noTelepon'],
          rhesus: x['rhesus'],
          tanggalSimpan: x['tanggalSimpan'],
          tanggalInfeksi: x['tanggalInfeksi'],
          tanggalSembuh: x['tanggalSembuh'],
          beratBadan: x['beratBadan'],
          riwayatPenyakit: x['riwayatPenyakit'] == null
              ? null
              : x['riwayatPenyakit'].cast<String>(),
          gejala: x['gejala'] == null ? null : x['gejala'].cast<String>(),
          catatanTambahan: x['catatanTambahan'],
          emailPendaftar: x['emailPendaftar'],
          nik: x['nik'],
          himself: x['himself'],
          melahirkan: x['melahirkan']));
    }
    return listPemberiDonor;
  }

  static Future<void> deletePemberiDonorById(String idDataPemberiDonor) async {
    String url = base_url +
        "deleteDataPemberiDonor?idDataPemberiDonor=$idDataPemberiDonor";
    http.Response response = await http.Client().delete(url);
    print(response);
  }

  static Future<PemberiDonor> createPemberiDonor(PemberiDonor penerima) async {
    String url = base_url + "createDataPemberiDonor";
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(penerima.toJson()),
    );
    var data = json.decode(response.body);
    data = data['result'];
    PemberiDonor penerimaDonor =
        await PemberiDonorService.convertToPemberiDonor(data);
    return penerimaDonor;
  }
}
