part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              ListView(
                children: [],
              ),
              TopBar("Profil Saya")
            ],
          ),
        ),
      ),
    );
  }
}