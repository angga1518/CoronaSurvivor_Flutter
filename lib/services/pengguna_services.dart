part of 'services.dart';

class PenggunaServices {
  static Future<void> savePengguna(Pengguna pengguna) async {
    // String url = base_url + "pengguna/create";
    // final http.Response response = await http.post(
    //   url,
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'id': pengguna.id,
    //     'email': pengguna.email,
    //     'name': pengguna.name,
    //   }),
    // );
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
        listIdArtikelDisimpan: data['listIdArtikelDisimpan'],
        listIdLikedArtikel: data['listIdLikedArtikel'],
        listIdLikedKomentar: data['listIdLikedKomentar']);
    return pengguna;
  }
}
