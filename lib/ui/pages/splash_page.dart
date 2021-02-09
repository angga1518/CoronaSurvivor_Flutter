part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: UIHelper.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment
                      .topRight, // 10% of the width, so there are ten blinds.
                  colors: [
                    const Color(0xFFEB3549),
                    const Color(0xFFF35844)
                  ], // red to yellow
                ),
              ),
            ),
            Container(
              height: UIHelper.responsive.setHeight(360),
              width: UIHelper.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background_splashscreen.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: UIHelper.responsive.setHeight(50),
                  ),
                  Container(
                      height: UIHelper.responsive.setHeight(360),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/ill_splashscreen.png"),
                              fit: BoxFit.fill))),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: UIHelper.responsive.setHeight(231),
                color: Colors.white,
                child: Column(
                  children: [
                    Logo(63, 25, 29, 215),
                    UIHelper.vertSpace(15),
                    UIHelper.horzSpace(UIHelper.width),
                    Text(
                      "LawanCovid adalah aplikasi yang bermanfaat\nsebagai tindakan preventif dan represif\nterhadap pandemi covid-19",
                      style: UIHelper.greyFont,
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.vertSpace(20),
                    PinkButton("Lanjut", () {
                      pageBloc.add(GoToHomePage());
                    })
                  ],
                ),
              ),
            )
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
