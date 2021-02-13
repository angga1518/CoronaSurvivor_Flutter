part of 'pages.dart';

class DonorReceiverPage extends StatefulWidget {
  @override
  _DonorReceiverPageState createState() => _DonorReceiverPageState();
}

class _DonorReceiverPageState extends State<DonorReceiverPage> {
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
                      PinkButton("Keluar", () {}),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar("Pemberi Donor", () {
                pageBloc.add(GoToProfilePage());
              })
            ],
          ),
        ),
      ),
    );
  }
}