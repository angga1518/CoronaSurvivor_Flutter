part of 'services.dart';

class ArtikelServices {
  static Future<List<Artikel>> getAllArtikel(String email) async {
    String url = base_url + "getAllArtikel?email=" + email;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    data = data['result'];
    List<Artikel> listArtikel =
        await ArtikelServices.convertToListArtikel(data);    
    return listArtikel;
  }

  static Future<List<Artikel>> getAllSavedArtikel(String email) async {
    String url = base_url + "getSavedArtikel?email=" + email;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    data = data['result'];
    List<Artikel> listArtikel =
        await ArtikelServices.convertToListArtikel(data);
    return listArtikel;
  }

  static Future<Artikel> getArtikelDetails(
      String idArtikelEndpoint, String email) async {
    String url = base_url +
        "getArtikelById?idArtikel=" +
        idArtikelEndpoint +
        "&email=" +
        email;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    data = data['result'];
    String author = data['author'];
    String institusi = data['institusi'];
    String deskripsi = data['deskripsi'];
    String judul = data['judul'];
    String idArtikel = data['idArtikel'];
    String tanggalPost = data['tanggalPost'];
    String imageUrl = data['imageUrl'];
    int jumlahView = data['jumlahView'];
    int jumlahLike = data['jumlahLike'];
    bool isLiked = data['liked'];
    List<dynamic> listIdkomentar = data['listIdComment'];
    Artikel artikel = new Artikel(
        author: author,
        idArtikel: idArtikel,
        institusi: institusi,
        deskripsi: deskripsi,
        judul: judul,
        tanggalPost: tanggalPost,
        jumlahLike: jumlahLike,
        jumlahView: jumlahView,
        imageUrl: imageUrl,
        isLiked: isLiked);
    return artikel;
  }
  



  static Future<List<Artikel>> convertToListArtikel(var data) async {
    List<dynamic> listResult = data as List<dynamic>;
    List<Artikel> listArtikel = [];
    for (var i = 0; i < listResult.length; i++) {
      Map<String, dynamic> x = listResult[i] as Map<String, dynamic>;
      String author = x['author'];
      String institusi = x['institusi'];
      String deskripsi = x['deskripsi'];
      String judul = x['judul'];
      String idArtikel = x['idArtikel'];
      String tanggalPost = x['tanggalPost'];
      String imageUrl = x['imageUrl'];
      int jumlahView = x['jumlahView'];
      int jumlahLike = x['jumlahLike'];
      bool isLiked = x['liked'];
      List<dynamic> listIdkomentar = x['listIdComment'];
      Artikel artikel = new Artikel(
          author: author,
          idArtikel: idArtikel,
          institusi: institusi,
          deskripsi: deskripsi,
          judul: judul,
          tanggalPost: tanggalPost,
          jumlahLike: jumlahLike,
          jumlahView: jumlahView,
          imageUrl: imageUrl,
          isLiked: isLiked);
      listArtikel.add(artikel);
    }
    return listArtikel;
  }
}
