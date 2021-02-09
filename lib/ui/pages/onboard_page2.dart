part of 'pages.dart';

class OnboardPage2 extends StatefulWidget {
  @override
  _OnboardPage2State createState() => _OnboardPage2State();
}

class _OnboardPage2State extends State<OnboardPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: UIHelper.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
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
                      image: AssetImage("assets/background_onboard.png"),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: UIHelper.responsive.setHeight(350),
                color: Colors.white,
                child: Column(
                  children: [
                    UIHelper.vertSpace(73),
                    Logo(37, 15, 17, 142),
                    UIHelper.vertSpace(32),
                    UIHelper.horzSpace(UIHelper.width),
                    SizedBox(
                      height: UIHelper.responsive.setHeight(63),
                      child: Text(
                        "Ketahui keadaan lokasi tujuan terlebih\ndahulu sebelum anda bepergian",
                        style: UIHelper.greyFont
                            .copyWith(fontSize: UIHelper.responsive.setSp(15)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    UIHelper.vertSpace(30),
                    UIHelper.fourBubble(2),
                    UIHelper.vertSpace(24),
                    Text(
                      "swipe >>",
                      style: UIHelper.greyFont.copyWith(
                          color: UIHelper.colorGreySuperLight,
                          fontSize: UIHelper.responsive.setSp(10)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: UIHelper.responsive.setHeight(80),
                  ),
                  Container(
                      height: UIHelper.responsive.setHeight(281),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/background_onboard2.png"),
                              fit: BoxFit.contain))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
