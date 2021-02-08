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
      body: Container(
        color: UIHelper.color1,
        height: UIHelper.responsive.setHeight(160.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("SignUp",
                    style: UIHelper.testFont.copyWith(fontSize: 15)),
                onPressed: () async {
                  await AuthServices.signUp(
                      "erlanggamuhammad01@gmail.com", "corona", "Angga");
                },
              ),
              RaisedButton(
                  child: Text(
                    "SignIn",
                    style: UIHelper.testFont.copyWith(fontSize: 15),
                  ),
                  onPressed: () async {
                    await AuthServices.signIn(
                        "erlanggamuhammad01@gmail.com", "corona");
                  }),
              // ButtonUniversal(50, () async {
              //   await AuthServices.signIn(
              //       "erlanggamuhammad01@gmail.com", "corona");
              // })
            ],
          ),
        ),
      ),
    );
  }
}
