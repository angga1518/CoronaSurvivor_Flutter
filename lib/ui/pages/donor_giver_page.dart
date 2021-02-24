part of 'pages.dart';

class DonorGiverPage extends StatefulWidget {
  final Pengguna pengguna;
  DonorGiverPage(this.pengguna);
  @override
  _DonorGiverPageState createState() => _DonorGiverPageState();
}

class _DonorGiverPageState extends State<DonorGiverPage> {
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
                              InformationContainer("NIK", "327511028464393"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Jenis Kelamin", "Perempuan"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Domisili", "Jakarta Selatan"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Tanggal Lahir", "30/02/2000"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Email", "sigigibesar@gmail.com"),
                              UIHelper.vertSpace(10),
                              InformationContainer("No Telp", "081532453621"),
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      CardContainer(
                          "Keterangan Pendonor",
                          Column(
                            children: [
                              InformationContainer("Golonga Darah", "A"),
                              UIHelper.vertSpace(10),
                              InformationContainer("Rhesus", "(-)"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Tanggal Positif", "30/02/2000"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Tanggal Negatif", "30/02/2000"),
                              UIHelper.vertSpace(10),
                              InformationContainer("Gejala yang Dialami",
                                  "Batuk\nPilek\nDemam\nAnosmia"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Riwayat Penyakit", "Asma\nRhinitis"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Sudah Pernah Melahirkan", "Ya"),
                              UIHelper.vertSpace(10),
                              InformationContainer("Berat Badan", "45 kg"),
                              UIHelper.vertSpace(10),
                              InformationContainer("Catatan Tambahan",
                                  "Saya belum pernah donor darah"),
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      PinkButton("Hapus", () {}),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar("Pemberi Donor", () {
                pageBloc.add(GoToProfilePage(widget.pengguna));
              })
            ],
          ),
        ),
      ),
    );
  }
}
