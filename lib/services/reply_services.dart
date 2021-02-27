part of "services.dart";

class ReplyServices {
  static Future<void> saveReply(Reply reply, String idKomentar) async {
    //localhost:8080/createReply?idParentKomentar=a409fb25879643c1b38555812b17616b
    String url = base_url + "createReply?idParentKomentar=" + idKomentar;
    http.Response response = await http.Client().post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "namaLengkap": reply.namaLengkap,
        "isi": reply.isi
      }),
    );
  }
}
