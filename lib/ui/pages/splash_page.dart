part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: UIHelper.responsive.setHeight(350),
              color: Color(0xFFEB3549),
            ),
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/background_splashscreen.png"),
                            fit: BoxFit.fill))),
                SizedBox(
                  height: 450,
                ),
                Logo()
              ],
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: UIHelper.responsive.setSp(50)),
              width: MediaQuery.of(context).size.width,
              height: UIHelper.responsive.setHeight(350),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/il_splashscreen.png"),
                      fit: BoxFit.fill)),
            ),
          ],
        ),
      ),
      // PinkButton("Login", () async {
      //   await AuthServices.signIn(
      //       "erlanggamuhammad01@gmail.com", "corona");
      // })
    );
  }
}
