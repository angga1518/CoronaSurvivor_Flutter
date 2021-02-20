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
                      CardContainer("Data Diri",
                          BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is UserLoaded) {
                            Pengguna pengguna = state.pengguna;
                            return Column(
                              children: [
                                InformationContainer(
                                    "Nama Lengkap", pengguna.namaLengkap),
                                UIHelper.vertSpace(10),
                                InformationContainer("Tanggal Lahir",
                                    pengguna.getTanggalLahir()),
                                UIHelper.vertSpace(10),
                                InformationContainer("Email", pengguna.email)
                              ],
                            );
                          }
                          return Container();
                        },
                      )),
                      UIHelper.vertSpace(18),
                      CardContainer(
                          "Data Pemberi Donor",
                          Column(
                            children: [
                              ListNavigationContainer(
                                  "Muhammad Erlangga", "O", "Jakarta", () {
                                pageBloc.add(GoToDonorGiverPage());
                              }),
                              UIHelper.vertSpace(10),
                              ListNavigationContainer(
                                  "Alfan Adhitia", "A", "Depok", () {
                                pageBloc.add(GoToDonorGiverPage());
                              }),
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      CardContainer(
                          "Data Penerima Donor",
                          Column(
                            children: [
                              ListNavigationContainer(
                                  "Muhammad Erlangga", "O", "Jakarta", () {
                                pageBloc.add(GoToDonorReceiverPage());
                              }),
                              UIHelper.vertSpace(10),
                              ListNavigationContainer(
                                  "Alfan Adhitia", "A", "Depok", () {
                                pageBloc.add(GoToDonorReceiverPage());
                              }),
                            ],
                          )),
                      UIHelper.vertSpace(20),
                      PinkButton("Keluar", () async {
                        await AuthServices.signOut();
                      }),
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
