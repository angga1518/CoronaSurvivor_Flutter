part of 'pages.dart';

class OnboardPage4 extends StatefulWidget {
  @override
  _OnboardPage4State createState() => _OnboardPage4State();
}

class _OnboardPage4State extends State<OnboardPage4> {
  @override
  Widget build(BuildContext context) {
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
              height: UIHelper.setResHeight(360),
              width: UIHelper.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background_onboard.png"),
                      fit: BoxFit.contain)),
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
                    Text(
                      "Gunakan MyCalendar untuk mencatat\nperkembangan Anda bila Anda terjangkit\nvirus covid-19. MyCalendar Anda juga\ndapat terhubung dengan puskesmas yang\nAnda kunjungi.",
                      style: UIHelper.greyFont
                          .copyWith(fontSize: UIHelper.setResFontSize(15)),
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.vertSpace(29),
                    PinkButton("Mulai", () {
                      pageBloc.add(GoToHomePage());
                    })
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  UIHelper.vertSpace(136),
                  Container(
                      margin: EdgeInsets.only(
                          left: UIHelper.setResWidth(15)),
                      height: UIHelper.setResHeight(200),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/background_onboard4.png"),
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
