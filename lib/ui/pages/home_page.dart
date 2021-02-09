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
            )
          ],
        ),
      ),
    );
  }
}
