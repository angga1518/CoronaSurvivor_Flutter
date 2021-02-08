part of 'services.dart';

class PenggunaServices {
  static Future<void> savePengguna(Pengguna pengguna) async {
    String url = base_url + "pengguna/create";
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': pengguna.id,
        'email': pengguna.email,
        'name': pengguna.name,
      }),
    );
  }

  static Future<Pengguna> getPengguna(String userId) async {
    String url = base_url + "pengguna/get?id=" + userId;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    Pengguna pengguna = Pengguna(data['id'], data['email'], name: data['name']);
    return pengguna;
  }
}
