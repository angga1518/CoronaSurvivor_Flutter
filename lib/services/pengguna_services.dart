part of 'services.dart';

class PenggunaServices {
  static Future<void> savePengguna(Pengguna pengguna) async {
    String url = base_url + "pengguna/create";
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": pengguna.email,
        "namaLengkap": pengguna.namaLengkap,
        "tanggalLahir": pengguna.getTanggalLahir(),
        "jenisKelamin": pengguna.jenisKelamin,
        "domisili": pengguna.domisili,
        "noTelepon": pengguna.noTelepon
      }),
    );
  }

  static Future<Pengguna> getPengguna(String email) async {
    String url = base_url + "pengguna/get?email=" + email;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    data = data['result'];
    Pengguna pengguna = Pengguna(
        namaLengkap: data['namaLengkap'],
        email: data['email'],
        tanggalLahir: data['tanggalLahir'],
        jenisKelamin: data['jenisKelamin'],
        domisili: data['domisili'],
        noTelepon: data['noTelepon'],
        listIdArtikelDisimpan: data['listIdArtikelDisimpan'] == null
            ? null
            : data['listIdArtikelDisimpan'].cast<String>(),
        listIdLikedArtikel: data['listIdLikedArtikel'] == null
            ? null
            : data['listIdLikedArtikel'].cast<String>(),
        listIdLikedKomentar: data['listIdLikedKomentar'] == null
            ? null
            : data['listIdLikedKomentar'].cast<String>());
    return pengguna;
  }
}
