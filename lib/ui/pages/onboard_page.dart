part of 'pages.dart';

class OnboardPage extends StatefulWidget {
  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          OnboardPage1(),
          OnboardPage2(),
          OnboardPage3(),
          OnboardPage4()
        ],
      ),
    );
  }
}
