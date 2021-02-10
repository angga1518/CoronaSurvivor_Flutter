part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        pageBloc.add(GoToOnboardPage());
        return false;
      },
      child: Scaffold(
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
                    GestureDetector(
                      onTap: () {
                        pageBloc.add(GoToProfilePage());
                      },
                      child: Container(
                        height: UIHelper.responsive.setHeight(32),
                        width: UIHelper.responsive.setWidth(32),
                        decoration: BoxDecoration(
                          color: UIHelper.colorSoftPink,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: SizedBox(
                            child: Image(
                              image: AssetImage("assets/user.png"),
                              height: UIHelper.responsive.setHeight(20),
                              width: UIHelper.responsive.setWidth(20),
                            ),
                          ),
                        ),
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
      ),
    );
  }
}
