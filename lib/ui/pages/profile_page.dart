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
        pageBloc.add(GoToHomePage());
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
                children: [
                  Column(
                    children: [
                      UIHelper.vertSpace(88),
                      CardContainer(
                          "Data Diri",
                          Column(
                            children: [
                              InformationContainer(
                                  "Nama Lengkap", "Nur Fauziah Hasanah"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Tanggal Lahir", "30/02/2000"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Email", "sigigibesar@gmail.com"),
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      CardContainer(
                          "Data Pemberi Donor",
                          Column(
                            children: [
                              ListNavigationContainer(
                                  "Muhammad Erlangga", "O", "Jakarta", () {pageBloc.add(GoToDonorGiverPage());}),
                              UIHelper.vertSpace(10),
                              ListNavigationContainer(
                                  "Alfan Adhitia", "A", "Depok", () {pageBloc.add(GoToDonorGiverPage());}),
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      CardContainer(
                          "Data Penerima Donor",
                          Column(
                            children: [
                              ListNavigationContainer(
                                  "Muhammad Erlangga", "O", "Jakarta", () {pageBloc.add(GoToDonorReceiverPage());}),
                              UIHelper.vertSpace(10),
                              ListNavigationContainer(
                                  "Alfan Adhitia", "A", "Depok", () {pageBloc.add(GoToDonorReceiverPage());}),
                            ],
                          )),
                      UIHelper.vertSpace(20),
                      PinkButton("Keluar", () {}),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar("Profil Saya", () {
                pageBloc.add(GoToHomePage());
              })
            ],
          ),
        ),
      ),
    );
  }
}
