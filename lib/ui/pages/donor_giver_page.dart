part of 'pages.dart';

class DonorGiverPage extends StatefulWidget {
  final Pengguna pengguna;
  final PemberiDonor pemberiDonor;
  DonorGiverPage(this.pengguna, this.pemberiDonor);
  @override
  _DonorGiverPageState createState() => _DonorGiverPageState();
}

class _DonorGiverPageState extends State<DonorGiverPage> {
  PemberiDonor pemberiDonor;
  @override
  Widget build(BuildContext context) {
    pemberiDonor = widget.pemberiDonor;
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
                                  "Nama Lengkap", pemberiDonor.namaLengkap),
                              UIHelper.vertSpace(10),
                              InformationContainer("NIK", pemberiDonor.nik),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Jenis Kelamin", pemberiDonor.jenisKelamin),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Domisili", pemberiDonor.domisili),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Tanggal Lahir",
                                  getTanggalFormatted(
                                      pemberiDonor.tanggalLahir)),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Email", pemberiDonor.emailPendaftar),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "No Telp", pemberiDonor.noTelepon),
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      CardContainer(
                          "Keterangan Pendonor",
                          Column(
                            children: [
                              InformationContainer(
                                  "Golongan Darah", pemberiDonor.golonganDarah),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Rhesus", "(${pemberiDonor.rhesus})"),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Tanggal Positif",
                                  getTanggalFormatted(
                                      pemberiDonor.tanggalInfeksi)),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Tanggal Negatif",
                                  getTanggalFormatted(
                                      pemberiDonor.tanggalSembuh)),
                              UIHelper.vertSpace(10),
                              InformationContainer("Gejala yang Dialami",
                                  pemberiDonor.formattedGejala()),
                              UIHelper.vertSpace(10),
                              InformationContainer("Riwayat Penyakit",
                                  pemberiDonor.formattedRiwayatPenyakit()),
                              UIHelper.vertSpace(10),
                              (pemberiDonor.jenisKelamin == "Perempuan")
                                  ? SizedBox(
                                      child: Column(
                                      children: [
                                        InformationContainer(
                                            "Sudah Pernah Melahirkan",
                                            pemberiDonor.melahirkan),
                                        UIHelper.vertSpace(10),
                                      ],
                                    ))
                                  : Container(),
                              InformationContainer("Berat Badan",
                                  "${pemberiDonor.noTelepon} kg"),
                              UIHelper.vertSpace(10),
                              (pemberiDonor.catatanTambahan != "")
                                  ? InformationContainer("Catatan Tambahan",
                                      pemberiDonor.catatanTambahan)
                                  : Container(),
                              UIHelper.vertSpace(10),
                              InformationContainer("Pernah Melahirkan",
                                  "(${pemberiDonor.melahirkan})"),
                              UIHelper.vertSpace(10),
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      PinkButton("Hapus", () async {
                        showPopUp(context: context, child: PopUpLoadingChild());
                        await PemberiDonorService.deletePemberiDonorById(
                                pemberiDonor.idDataPemberiDonor)
                            .whenComplete(() => Navigator.pop(context));
                        pageBloc.add(GoToProfilePage(widget.pengguna));
                      }),
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
