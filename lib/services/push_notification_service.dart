part of 'services.dart';

class PushNotifServices {
  static void updateAccessToken(String userId, String token,
      {http.Client client}) async {
    String url = base_url + "update-token";
    client ?? http.Client();
    final http.Response response = await client.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': userId,
        'token': token,
      }),
    );
  }
}
