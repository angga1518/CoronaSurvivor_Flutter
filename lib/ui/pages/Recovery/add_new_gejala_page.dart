part of '../pages.dart';

class AddNewGejalaPage extends StatefulWidget {
  @override
  _AddNewGejalaPageState createState() => _AddNewGejalaPageState();
}

class _AddNewGejalaPageState extends State<AddNewGejalaPage> {
  Gejala _gejala;
  @override
  Widget build(BuildContext context) {
    return CalendarDefaultTemplate(
      SizedBox(
        child: Column(
          children: [
            generateRadionButton(_gejala, Gejala.Demam, (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Demam"),
            generateRadionButton(_gejala, Gejala.Batuk, (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Batuk"),
            generateRadionButton(_gejala, Gejala.Hilang_Penciuman,
                (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Hilang Penciuman"),
            generateRadionButton(_gejala, Gejala.Kemampuan_Penciuman_Berkurang,
                (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Kemampuan Penciuman Berkurang"),
            generateRadionButton(_gejala, Gejala.Hilang_Pengecapan,
                (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Hilang Pengecapan"),
            generateRadionButton(_gejala, Gejala.Kemampuan_Pengecapan_Berkurang,
                (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Kemampuan Pengecapan Berkurang"),
            generateRadionButton(_gejala, Gejala.Badan_Pegal, (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Badan Pegal"),
            generateRadionButton(_gejala, Gejala.Meriang, (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Meriang"),
            generateRadionButton(_gejala, Gejala.Pusing, (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Pusing"),
            generateRadionButton(_gejala, Gejala.Mual, (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Mual"),
            generateRadionButton(_gejala, Gejala.Muntah, (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Muntah"),
            generateRadionButton(_gejala, Gejala.Selera_Makan_Berkurang,
                (Gejala gejala) {
              setState(() {
                _gejala = gejala;
              });
            }, "Selera Makan Berkurang"),
          ],
        ),
      ),
      backTo: GoToRecoveryOnBoardPage(),
      goTo: GoToSuccessPage(
          goTo: GoToAddRecoveryPage(),
          backTo: GoToRecoveryOnBoardPage(),
          pinkButtonMessage: "Isi Gejala Hari Ini",
          message:
              "Gejala Anda berhasil disimpan, silahkan isi gejala anda hari ini untuk mengabari tim dari Puskesmas"),
      desc: "Masukkan gejala yang Anda alami",
      header: "Tambah Gejala",
      space: 20,
      isEnabled: _gejala != null,
    );
  }
}

Widget generateRadionButton(
    Gejala groupValue, Gejala value, Function onChanged, String desc) {
  return Row(
    children: [
      UIHelper.horzSpace(10),
      Radio<Gejala>(
        activeColor: UIHelper.colorMainLightRed,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
      UIHelper.horzSpace(10),
      SizedBox(
        width: UIHelper.setResWidth(220),
        child: Text(
          desc,
          style: UIHelper.greyLightFont
              .copyWith(fontSize: UIHelper.setResFontSize(15)),
        ),
      ),
    ],
  );
}

enum Gejala {
  Demam,
  Batuk,
  Hilang_Penciuman,
  Kemampuan_Penciuman_Berkurang,
  Hilang_Pengecapan,
  Kemampuan_Pengecapan_Berkurang,
  Badan_Pegal,
  Meriang,
  Pusing,
  Mual,
  Muntah,
  Selera_Makan_Berkurang
}
