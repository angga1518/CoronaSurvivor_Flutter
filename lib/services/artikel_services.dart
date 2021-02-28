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
    bool isSaved = data['saved'];
    List<dynamic> listIdkomentar = data['listIdComment'];
    Artikel artikel = new Artikel(
        listIdComment: listIdkomentar.cast<String>(),
        author: author,
        idArtikel: idArtikel,
        institusi: institusi,
        deskripsi: deskripsi,
        judul: judul,
        tanggalPost: tanggalPost,
        jumlahLike: jumlahLike,
        jumlahView: jumlahView,
        imageUrl: imageUrl,
        isLiked: isLiked,
        isSaved: isSaved);
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
      bool isSaved = x['saved'];
      List<dynamic> listIdkomentar = x['listIdComment'];
      Artikel artikel = new Artikel(
          listIdComment: listIdkomentar.cast<String>(),
          author: author,
          idArtikel: idArtikel,
          institusi: institusi,
          deskripsi: deskripsi,
          judul: judul,
          tanggalPost: tanggalPost,
          jumlahLike: jumlahLike,
          jumlahView: jumlahView,
          imageUrl: imageUrl,
          isSaved: isSaved,
          isLiked: isLiked);
      listArtikel.add(artikel);
    }
    return listArtikel;
  }

  static Future<void> postSavedArtikel(Artikel artikel, String email) async {
    //localhost:8080/postSavedArtikel?email=alfangg@gmail.com
    String url = base_url + "postSavedArtikel?email=" + email;
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "idArtikel": artikel.idArtikel,
        "liked": artikel.isLiked.toString()
      }),
    );
  }

  static Future<Artikel> likeArtikel(Artikel artikel, String email) async {
    String url = base_url + "postLikedArtikel?email=" + email;
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "idArtikel": artikel.idArtikel,
        "liked": artikel.isLiked.toString(),
      }),
    );
    var data = json.decode(response.body);
    data = data['result'];
    return new Artikel(
      idArtikel: data["idArtikel"],
      isLiked: data["isLiked"] == "true" ? true : false,
    );
  }
}
