part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final Pengguna pengguna;
  ProfilePage(this.pengguna);
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
                                pageBloc
                                    .add(GoToDonorGiverPage(widget.pengguna));
                              }),
                              UIHelper.vertSpace(10),
                              ListNavigationContainer(
                                  "Alfan Adhitia", "A", "Depok", () {
                                pageBloc
                                    .add(GoToDonorGiverPage(widget.pengguna));
                              }),
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      CardContainer(
                          "Data Penerima Donor",
                          FutureBuilder(
                              future:
                                  PenerimaDonorService.getPenerimaDonorByEmail(
                                      widget.pengguna.email),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  List<PenerimaDonor> listPenerimaDonor =
                                      snapshot.data as List<PenerimaDonor>;
                                  List<Widget> children = [];
                                  for (PenerimaDonor penerimaDonor
                                      in listPenerimaDonor) {
                                    children.add(ListNavigationContainer(
                                        penerimaDonor.namaLengkap,
                                        penerimaDonor.golonganDarah,
                                        penerimaDonor.domisili, () {
                                      pageBloc.add(GoToDonorReceiverPage(
                                          widget.pengguna, penerimaDonor));
                                    }));
                                    children.add(UIHelper.vertSpace(10));
                                  }
                                  return Column(
                                    children: children,
                                  );
                                } else {
                                  return Container(
                                    child: Center(
                                        child: SpinKitThreeBounce(
                                            color: UIHelper.colorMainLightRed,
                                            size: UIHelper.setResWidth(20))),
                                  );
                                }
                              })),
                      UIHelper.vertSpace(10),
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
