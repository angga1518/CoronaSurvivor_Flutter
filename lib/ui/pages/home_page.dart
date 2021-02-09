part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: UIHelper.colorDarkWhite,
            ),
            Column(
              children: [],
            ),
            Container(
              height: UIHelper.responsive.setHeight(68),
              color: Colors.white,
              child: Row(
                children: [
                  UIHelper.horzSpace(23),
                  Container(
                    height: UIHelper.responsive.setHeight(32),
                    width: UIHelper.responsive.setWidth(32),
                    decoration: BoxDecoration(
                      color: UIHelper.colorSoftPink,
                      borderRadius: BorderRadius.circular(8), 
                      image: DecorationImage(image: AssetImage("assets/user.png"))
                    ),
                  ),
                  UIHelper.horzSpace(56),
                  Logo(39, 15, 18, 148)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
