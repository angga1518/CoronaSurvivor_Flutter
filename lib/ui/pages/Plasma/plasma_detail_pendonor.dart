part of '../pages.dart';

class PlasmaDetailPendonor extends StatefulWidget {
  final Pengguna pengguna;
  final PemberiDonor penerimaDonor;
  PlasmaDetailPendonor(this.pengguna, this.penerimaDonor);
  @override
  _PlasmaDetailPendonorState createState() => _PlasmaDetailPendonorState();
}

class _PlasmaDetailPendonorState extends State<PlasmaDetailPendonor> {
  @override
  Widget build(BuildContext context) {
    PemberiDonor pendonor = widget.penerimaDonor;
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
                              InformationContainer("Nama Lengkap",
                                  pendonor.censor(pendonor.namaLengkap)),
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
                          "Keterangan Pendonor",
                          Column(
                            children: [
                              InformationContainer(
                                  "Golongan Darah", pendonor.golonganDarah),
                              UIHelper.vertSpace(10),
                              InformationContainer(
                                  "Rhesus", "(${pendonor.rhesus})"),
                              UIHelper.vertSpace(10),
                              InformationContainer("Tanggal Infeksi",
                                  getTanggalFormatted(pendonor.tanggalInfeksi)),
                              UIHelper.vertSpace(10),
                              InformationContainer("Tanggal Sembuh",
                                  getTanggalFormatted(pendonor.tanggalSembuh)),
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
                                  : Container(),
                              InformationContainer("Pernah Melahirkan",
                                  "(${pendonor.melahirkan})"),
                              UIHelper.vertSpace(10),
                            ],
                          )),
                      UIHelper.vertSpace(18),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar("Pemberi Donor", () {
                pageBloc.add(GoToPlasmaPage(widget.pengguna));
              })
            ],
          ),
        ),
      ),
    );
  }
}
