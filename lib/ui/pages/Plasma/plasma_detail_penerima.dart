part of '../pages.dart';

class PlasmaDetailPenerima extends StatefulWidget {
  final Pengguna pengguna;
  final PenerimaDonor penerimaDonor;
  PlasmaDetailPenerima(this.pengguna, this.penerimaDonor);
  @override
  _PlasmaDetailPenerimaState createState() => _PlasmaDetailPenerimaState();
}

class _PlasmaDetailPenerimaState extends State<PlasmaDetailPenerima> {
  @override
  Widget build(BuildContext context) {
    PenerimaDonor pendonor = widget.penerimaDonor;
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
                                  "Nama Lengkap", pendonor.namaLengkap),
                              UIHelper.vertSpace(10),
                              // InformationContainer("NIK", pendonor.nik),
                              // UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Jenis Kelamin", pendonor.jenisKelamin),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Domisili", pendonor.domisili),
                              UIHelper.vertSpace(10),
                              InformationContainer("Tanggal Lahir",
                                  getTanggalFormatted(pendonor.tanggalLahir)),
                              UIHelper.vertSpace(10),
                              InformationContainer("Email", pendonor.email),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "No Telp", pendonor.noTelepon),
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      CardContainer(
                          "Keterangan Penerima",
                          Column(
                            children: [
                              InformationContainer(
                                  "Golongan Darah", pendonor.golonganDarah),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Rhesus", "(${pendonor.rhesus})"),
                              UIHelper.vertSpace(10),
                              InformationContainer("Tanggal Positif",
                                  getTanggalFormatted(pendonor.tanggalPositif)),
                              UIHelper.vertSpace(10),
                              InformationContainer("Tanggal Muncul Gejala",
                                  getTanggalFormatted(pendonor.tanggalGejala)),
                              UIHelper.vertSpace(10),
                              InformationContainer("Gejala yang Dialami",
                                  pendonor.formattedGejala()),
                              UIHelper.vertSpace(10),
                              InformationContainer("Riwayat Penyakit",
                                  pendonor.formattedRiwayatPenyakit()),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Berat Badan", "${pendonor.beratBadan} kg"),
                              UIHelper.vertSpace(10),
                              (pendonor.catatanTambahan != "")
                                  ? InformationContainer("Catatan Tambahan",
                                      pendonor.catatanTambahan)
                                  : Container()
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar("Penerima Donor", () {
                pageBloc.add(GoToPlasmaPage(widget.pengguna));
              })
            ],
          ),
        ),
      ),
    );
  }
}
