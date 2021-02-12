part of 'pages.dart';

class OnboardPage3 extends StatefulWidget {
  @override
  _OnboardPage3State createState() => _OnboardPage3State();
}

class _OnboardPage3State extends State<OnboardPage3> {
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
              height: UIHelper.setResHeight(360),
              width: UIHelper.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background_onboard.png"),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: UIHelper.setResHeight(350),
                color: Colors.white,
                child: Column(
                  children: [
                    UIHelper.vertSpace(73),
                    Logo(37, 15, 17, 142),
                    UIHelper.vertSpace(32),
                    UIHelper.horzSpace(UIHelper.width),
                    SizedBox(
                      height: UIHelper.setResHeight(63),
                      child: Text(
                        "Dapatkan tips dan informasi mengenai\npencegahan dan penanggulangan covid-19",
                        style: UIHelper.greyFont
                            .copyWith(fontSize: UIHelper.setResFontSize(15)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    UIHelper.vertSpace(30),
                    UIHelper.fourBubble(3),
                    UIHelper.vertSpace(24),
                    Text(
                      "swipe >>",
                      style: UIHelper.greyFont.copyWith(
                          color: UIHelper.colorGreySuperLight,
                          fontSize: UIHelper.setResFontSize(10)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  UIHelper.vertSpace(130),
                  Container(
                      height: UIHelper.setResHeight(200),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/background_onboard3.png"),
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
