part of "services.dart";

class KomentarServices {
  static Future<List<Komentar>> getAllKomentarWithReplies(
      String idArtikel, String email) async {
    String url = base_url +
        "getKomentarArtikel?idArtikel=" +
        idArtikel +
        "&email=" +
        email;
    http.Response response = await http.Client().get(url);
    var data = json.decode(response.body);
    data = data['result'];
    List<dynamic> listResult = data as List<dynamic>;
    List<Komentar> listKomentar = [];

    for (var i = 0; i < listResult.length; i++) {
      Map<String, dynamic> x = listResult[i] as Map<String, dynamic>;
      String idKomentar = x['idKomentar'];
      String namaLengkap = x['namaLengkap'];
      String tanggalPost = x['tanggalPost'];
      String isi = x['isi'];
      int jumlahLike = x['jumlahLike'];
      bool isLiked = x['liked'];
      List<dynamic> listReplies = x['replies'];
      List<Reply> replies = [];
      for (var j = 0; j < listReplies.length; j++) {
        Map<String, dynamic> y = listReplies[j] as Map<String, dynamic>;
        String idReply = y['idKomentar'];
        String namaLengkapReply = y['namaLengkap'];
        String tanggalPostReply = y['tanggalPost'];
        String isiReply = y['isi'];

        Reply addedReply = new Reply(
            idReply: idReply,
            namaLengkap: namaLengkapReply,
            tanggalPost: tanggalPostReply,
            isi: isiReply);
        replies.add(addedReply);
      }

      Komentar addedKomentar = new Komentar(
          idKomentar: idKomentar,
          isLiked: isLiked,
          namaLengkap: namaLengkap,
          isi: isi,
          tanggalPost: tanggalPost,
          jumlahLike: jumlahLike,
          replies: replies);
      listKomentar.add(addedKomentar);
    }
    return listKomentar;
  }

  static Future<void> saveKomentar(Komentar komentar, String idArtikel) async {
    //localhost:8080/createKomentar?idArtikel=3g4DRCC6Y1OhO0Riwb9I
    String url = base_url + "createKomentar?idArtikel=" + idArtikel;
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "namaLengkap": komentar.namaLengkap,
        "tanggalPost": komentar.tanggalPost,
        "isi": komentar.isi,
        "jumlahLike": komentar.jumlahLike.toString(),
      }),
    );
  }
}
