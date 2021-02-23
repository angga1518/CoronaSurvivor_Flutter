part of '../pages.dart';

class AddRecoveryPage extends StatefulWidget {
  @override
  _AddRecoveryPageState createState() => _AddRecoveryPageState();
}

class _AddRecoveryPageState extends State<AddRecoveryPage> {
  TextEditingController saturasiController = TextEditingController();
  TextEditingController suhuTubuhController = TextEditingController();
  TextEditingController catatanTambahanController = TextEditingController();

  String selectedBatuk;
  String selectedAnosmia;
  String selectedMual;
  String selectedDemam;
  List<String> listPerkembangan = [
    "Ringan",
    "Sedang",
    "Parah",
    "Gejala sudah hilang",
    "Saya tidak dapat mengukur tingkat keparahannya"
  ];

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
                saturasiController.text = value;
              },
              false,
              isValid: true,
              helperText: "*Kosongkan bila tidak diketahui",
            ),
            UIHelper.vertSpace(10),
            TextFieldWidget(
              "Suhu Tubuh",
              "Suhu Tubuh",
              (value) {
                suhuTubuhController.text = value;
              },
              false,
              isValid: true,
              helperText: "*Kosongkan bila tidak diketahui",
            ),
            UIHelper.vertSpace(10),
            TextFieldWidget(
              "Catatan Tambahan",
              "Catatan Tambahan",
              (value) {
                catatanTambahanController.text = value;
              },
              false,
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
            DropdownTextField(
                items: listPerkembangan,
                value: selectedBatuk,
                hintText: "Batuk",
                onChange: (String value) {
                  setState(() {
                    selectedBatuk = value;
                  });
                }),
            UIHelper.vertSpace(15),
            DropdownTextField(
                items: listPerkembangan,
                value: selectedAnosmia,
                hintText: "Anosmia",
                onChange: (String value) {
                  setState(() {
                    selectedAnosmia = value;
                  });
                }),
            UIHelper.vertSpace(15),
            DropdownTextField(
                items: listPerkembangan,
                value: selectedMual,
                hintText: "Mual",
                onChange: (String value) {
                  setState(() {
                    selectedMual = value;
                  });
                }),
            UIHelper.vertSpace(15),
            DropdownTextField(
                items: listPerkembangan,
                value: selectedDemam,
                hintText: "Demam",
                onChange: (String value) {
                  setState(() {
                    selectedDemam = value;
                  });
                }),
            UIHelper.vertSpace(10),
          ],
        ),
      )),
      date: "01-10-2000",
      backTo: GoToRecoveryOnBoardPage(),
      withPinkButton: true,
      onPinkButtonTap: () {
        pageBloc.add(
          GoToSuccessPage(
              goTo: GoToCalendarHome(),
              backTo: GoToCalendarHome(),
              pinkButtonMessage: "Kembali ke MyCalendar",
              message:
                  "Laporan kondisi perkembangan kamu telah berhasil dikirimkan! silahkan press salah satu tanggal di MyCalendar untuk melihat status Anda"),
        );
      },
    );
  }
}
