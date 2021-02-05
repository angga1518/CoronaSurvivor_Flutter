part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    // test
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("SignUp"),
              onPressed: () async {
                await AuthServices.signUp("erlanggamuhammad01@gmail.com", "corona", "Angga");
              },
            ),
            RaisedButton(
              child: Text("SignIn"),
              onPressed: () async {
                await AuthServices.signIn("erlanggamuhammad01@gmail.com", "corona");
              },
            ),
          ],
        ),
      ),
    );
  }
}
