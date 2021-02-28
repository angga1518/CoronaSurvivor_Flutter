part of '../pages.dart';

class AddRecoveryPage extends StatefulWidget {
  CalendarModel calendar;
  AddRecoveryPage(this.calendar);
  @override
  _AddRecoveryPageState createState() => _AddRecoveryPageState();
}

class _AddRecoveryPageState extends State<AddRecoveryPage> {
  TextEditingController saturasiController = TextEditingController();
  TextEditingController suhuTubuhController = TextEditingController();
  TextEditingController catatanTambahanController = TextEditingController();

  bool isDemam = false;
  bool isBatuk = false;
  bool isHilangPenciuman = false;
  bool isKurangPenciuman = false;
  bool isHilangPengecapan = false;
  bool isKurangPengecapan = false;
  bool isBadanPegal = false;
  bool isMeriang = false;
  bool isPusing = false;
  bool isMual = false;
  bool isMuntah = false;
  bool isSeleraMakanBerkurang = false;
  bool isSesakNafas = false;
  bool isSaturasiKecil = false;
  bool isRadangTenggorokan = false;
  bool isMudahLelah = false;

  String selectedDemam;
  String selectedBatuk;
  String selectedHilangPenciuman;
  String selectedKurangPenciuman;
  String selectedHilangPengecapan;
  String selectedKurangPengecapan;
  String selectedBadanPegal;
  String selectedMeriang;
  String selectedPusing;
  String selectedMual;
  String selectedMuntah;
  String selectedSeleraMakanBerkurang;
  String selectedSesakNafas;
  String selectedSaturasiKecil;
  String selectedRadangTenggorokan;
  String selectedMudahLelah;

  List<UpdateGejalaModel> listUpdateGejalaModel = [];

  int countAdd = 0;

  Recovery recovery;

  List<String> listPerkembangan = [
    "Ringan",
    "Sedang",
    "Parah",
    "Gejala sudah hilang",
    "Saya tidak dapat mengukur tingkat keparahannya"
  ];

  @override
  void initState() {
    super.initState();
    _checkListGejala();
    recovery = Recovery(
        emailPengguna: widget.calendar.pengguna.email,
        nomorKalender: widget.calendar.nomorKalender,
        tanggalKalender: getTanggalFromDateTime(
            getDateTimeFromStringTanggal(widget.calendar.lastDate)
                .add(Duration(days: 1))));
    saturasiController.text = recovery.saturasi;
    suhuTubuhController.text = recovery.suhuTubuh;
    catatanTambahanController.text = recovery.catatanTambahan;
  }

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return RecoveryTemplate(
      child: SizedBox(
          child: Container(
        margin: EdgeInsets.only(bottom: UIHelper.setResHeight(10)),
        width: UIHelper.setResWidth(272),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Masukkan kondisi Anda saat ini",
                style: UIHelper.greyLightFont.copyWith(
                    fontSize: UIHelper.setResFontSize(13),
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.left),
            UIHelper.vertSpace(21),
            TextFieldWidget(
              "Saturasi",
              "Saturasi",
              (value) {
                // saturasiController.text = value;
              },
              false,
              isNumber: true,
              controller: saturasiController,
              isValid: true,
              helperText: "*Kosongkan bila tidak diketahui",
            ),
            UIHelper.vertSpace(10),
            TextFieldWidget(
              "Suhu Tubuh",
              "Suhu Tubuh",
              (value) {
                // suhuTubuhController.text = value;
              },
              false,
              isNumber: true,
              suffixText: "Celcius",
              controller: suhuTubuhController,
              isValid: true,
              helperText: "*Kosongkan bila tidak diketahui",
            ),
            UIHelper.vertSpace(10),
            TextFieldWidget(
              "Catatan Tambahan",
              "Catatan Tambahan",
              (value) {
                // catatanTambahanController.text = value;
              },
              false,
              controller: catatanTambahanController,
              isValid: true,
              helperText: "*Kosongkan bila tidak diketahui",
            ),
            UIHelper.vertSpace(20),
            Text("Masukkan perkembangan dari gejala Anda",
                style: UIHelper.greyLightFont.copyWith(
                    fontSize: UIHelper.setResFontSize(13),
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.left),
            UIHelper.vertSpace(20),
            (isDemam)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedDemam,
                            hintText: "Demam",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala("Demam"),
                                    namaGejala: "Demam"));
                                selectedDemam = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isBatuk)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedBatuk,
                            hintText: "Batuk",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala("Batuk"),
                                    namaGejala: "Batuk"));
                                selectedBatuk = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isHilangPenciuman)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedHilangPenciuman,
                            hintText: "Hilang Penciuman",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala(
                                        "Hilang Penciuman"),
                                    namaGejala: "Hilang Penciuman"));
                                selectedHilangPenciuman = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isKurangPenciuman)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedKurangPenciuman,
                            hintText: "Kemampuan Penciuman Berkurang",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala(
                                        "Kemampuan Penciuman Berkurang"),
                                    namaGejala:
                                        "Kemampuan Penciuman Berkurang"));
                                selectedKurangPenciuman = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isHilangPengecapan)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedHilangPengecapan,
                            hintText: "Hilang Pengecapan",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala(
                                        "Hilang Pengecapan"),
                                    namaGejala: "Hilang Pengecapan"));
                                selectedHilangPengecapan = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isKurangPengecapan)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedKurangPengecapan,
                            hintText: "Kemampuan Pengecapan Berkurang",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala(
                                        "Kemampuan Pengecapan Berkurang"),
                                    namaGejala:
                                        "Kemampuan Pengecapan Berkurang"));
                                selectedKurangPengecapan = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isBadanPegal)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedBadanPegal,
                            hintText: "Badan Pegal",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala("Badan Pegal"),
                                    namaGejala: "Badan Pegal"));
                                selectedBadanPegal = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isMeriang)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedMeriang,
                            hintText: "Meriang",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala("Meriang"),
                                    namaGejala: "Meriang"));
                                selectedMeriang = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isPusing)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedPusing,
                            hintText: "Pusing",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala("Pusing"),
                                    namaGejala: "Pusing"));
                                selectedPusing = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isMual)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedMual,
                            hintText: "Mual",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala("Mual"),
                                    namaGejala: "Mual"));
                                selectedMual = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isMuntah)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedMuntah,
                            hintText: "Muntah",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala("Muntah"),
                                    namaGejala: "Muntah"));
                                selectedMuntah = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isSeleraMakanBerkurang)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedSeleraMakanBerkurang,
                            hintText: "Selera Makan Berkurang",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala(
                                        "Selera Makan Berkurang"),
                                    namaGejala: "Selera Makan Berkurang"));
                                selectedSeleraMakanBerkurang = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isSesakNafas)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedSesakNafas,
                            hintText: "Sesak Nafas",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala("Sesak Nafas"),
                                    namaGejala: "Sesak Nafas"));
                                selectedSesakNafas = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isSaturasiKecil)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedSaturasiKecil,
                            hintText: "Saturasi <95",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala("Saturasi <95"),
                                    namaGejala: "Saturasi <95"));
                                selectedSaturasiKecil = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isRadangTenggorokan)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedRadangTenggorokan,
                            hintText: "Radang Tenggorokan",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala(
                                        "Radang Tenggorokan"),
                                    namaGejala: "Radang Tenggorokan"));
                                selectedRadangTenggorokan = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(15),
                      ],
                    ),
                  )
                : Container(),
            (isMudahLelah)
                ? SizedBox(
                    child: Column(
                      children: [
                        DropdownTextField(
                            items: listPerkembangan,
                            value: selectedMudahLelah,
                            hintText: "Mudah Lelah",
                            onChange: (String value) {
                              setState(() {
                                listUpdateGejalaModel.add(UpdateGejalaModel(
                                    update: value,
                                    uuid: getUUIDFromNamaGejala("Mudah Lelah"),
                                    namaGejala: "Mudah Lelah"));
                                selectedMudahLelah = value;
                                countAdd++;
                              });
                            }),
                        UIHelper.vertSpace(10),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      )),
      date: getTanggalFromDateTime(
          getDateTimeFromStringTanggal(widget.calendar.lastDate)
              .add(Duration(days: 1))),
      backTo: GoToRecoveryOnBoardPage(widget.calendar),
      withPinkButton: true,
      isPinkButtonEnabled: listUpdateGejalaModel.length != 0 &&
          countAdd == listUpdateGejalaModel.length,
      onPinkButtonTap: () async {
        recovery.catatanTambahan = catatanTambahanController.text;
        recovery.saturasi = saturasiController.text;
        recovery.suhuTubuh = suhuTubuhController.text;
        showPopUp(context: context, child: PopUpLoadingChild());
        recovery = await RecoveryService.createRecovery(recovery);
        await GejalaService.updateGejala(
                listUpdateGejalaModel,
                recovery.nomorKalender,
                getTanggalFromDateTime(
                    getDateTimeFromStringTanggal(widget.calendar.lastDate)
                        .add(Duration(days: 1))))
            .whenComplete(() => Navigator.pop(context));
        widget.calendar.lastDate = getTanggalFromDateTime(
            getDateTimeFromStringTanggal(widget.calendar.lastDate)
                .add(Duration(days: 1)));
        pageBloc.add(
          GoToSuccessPage(
              goTo: GoToCalendarHome(widget.calendar),
              backTo: GoToCalendarHome(widget.calendar),
              pinkButtonMessage: "Kembali ke MyCalendar",
              message:
                  "Laporan kondisi perkembangan kamu telah berhasil dikirimkan! silahkan press salah satu tanggal di MyCalendar untuk melihat status Anda"),
        );
      },
    );
  }

  String getUUIDFromNamaGejala(String namaGejala) {
    for (GejalaModel objectGejala in widget.calendar.listObjectGejala) {
      if (objectGejala.namaGejala == namaGejala) {
        return objectGejala.uuid;
      }
    }
    return null;
  }

  void _checkListGejala() {
    for (var i = 0; i < widget.calendar.listNamaGejala.length; i++) {
      String gejala = widget.calendar.listNamaGejala[i];
      switch (gejala) {
        case "Demam":
          isDemam = true;
          break;
        case "Batuk":
          isBatuk = true;
          break;
        case "Hilang Penciuman":
          isHilangPenciuman = true;
          break;
        case "Kemampuan Penciuman Berkurang":
          isKurangPenciuman = true;
          break;
        case "Hilang Pengecapan":
          isHilangPengecapan = true;
          break;
        case "Kemampuan Pengecapan Berkurang":
          isKurangPengecapan = true;
          break;
        case "Badan Pegal":
          isBadanPegal = true;
          break;
        case "Meriang":
          isMeriang = true;
          break;
        case "Pusing":
          isPusing = true;
          break;
        case "Mual":
          isMual = true;
          break;
        case "Muntah":
          isMuntah = true;
          break;
        case "Selera Makan Berkurang":
          isSeleraMakanBerkurang = true;
          break;
        case "Sesak Nafas":
          isSesakNafas = true;
          break;
        case "Saturasi <95":
          isSaturasiKecil = true;
          break;
        case "Radang Tenggorokan":
          isRadangTenggorokan = true;
          break;
        case "Mudah Lelah":
          isMudahLelah = true;
          break;
      }
    }
  }
}
