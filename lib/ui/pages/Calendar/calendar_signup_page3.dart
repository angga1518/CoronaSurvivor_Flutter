part of '../pages.dart';

class CalendarSignUpPage3 extends StatefulWidget {
  @override
  CalendarSignUpPage3State createState() => CalendarSignUpPage3State();
}

class CalendarSignUpPage3State extends State<CalendarSignUpPage3> {
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
  @override
  Widget build(BuildContext context) {
    return CalendarDefaultTemplate(
      SizedBox(
        child: Column(
          children: [
            generateCheckBox(
                title: "Demam",
                value: isDemam,
                onChange: (value) {
                  setState(() {
                    isDemam = value;
                  });
                }),
            generateCheckBox(
                title: "Batuk",
                value: isBatuk,
                onChange: (value) {
                  setState(() {
                    isBatuk = value;
                  });
                }),
            generateCheckBox(
                title: "Hilang Penciuman",
                value: isHilangPenciuman,
                onChange: (value) {
                  setState(() {
                    isHilangPenciuman = value;
                  });
                }),
            generateCheckBox(
                title: "Kemampuan Penciuman Berkurang",
                value: isKurangPenciuman,
                onChange: (value) {
                  setState(() {
                    isKurangPenciuman = value;
                  });
                }),
            generateCheckBox(
                title: "Hilang Pengecapan",
                value: isHilangPengecapan,
                onChange: (value) {
                  setState(() {
                    isHilangPengecapan = value;
                  });
                }),
            generateCheckBox(
                title: "Kemampuan Pengecapan Berkurang",
                value: isKurangPengecapan,
                onChange: (value) {
                  setState(() {
                    isKurangPengecapan = value;
                  });
                }),
            generateCheckBox(
                title: "Badan Pegal",
                value: isBadanPegal,
                onChange: (value) {
                  setState(() {
                    isBadanPegal = value;
                  });
                }),
            generateCheckBox(
                title: "Meriang",
                value: isMeriang,
                onChange: (value) {
                  setState(() {
                    isMeriang = value;
                  });
                }),
            generateCheckBox(
                title: "Pusing",
                value: isPusing,
                onChange: (value) {
                  setState(() {
                    isPusing = value;
                  });
                }),
            generateCheckBox(
                title: "Mual",
                value: isMual,
                onChange: (value) {
                  setState(() {
                    isMual = value;
                  });
                }),
            generateCheckBox(
                title: "Muntah",
                value: isMuntah,
                onChange: (value) {
                  setState(() {
                    isMuntah = value;
                  });
                }),
            generateCheckBox(
                title: "Selera Makan berkurang",
                value: isSeleraMakanBerkurang,
                onChange: (value) {
                  setState(() {
                    isSeleraMakanBerkurang = value;
                  });
                }),
            generateCheckBox(
                title: "Sesak Nafas",
                value: isSesakNafas,
                onChange: (value) {
                  setState(() {
                    isSesakNafas = value;
                  });
                }),
            generateCheckBox(
                title: "Saturasi <95",
                value: isSaturasiKecil,
                onChange: (value) {
                  setState(() {
                    isSaturasiKecil = value;
                  });
                }),
            generateCheckBox(
                title: "Radang Tenggorokan",
                value: isRadangTenggorokan,
                onChange: (value) {
                  setState(() {
                    isRadangTenggorokan = value;
                  });
                }),
            generateCheckBox(
                title: "Mudah Lelah",
                value: isMudahLelah,
                onChange: (value) {
                  setState(() {
                    isMudahLelah = value;
                  });
                }),
            UIHelper.vertSpace(20)
          ],
        ),
      ),
      space: 10,
      desc: "Masukkan gejala yang Anda alami",
      backTo: GoToCalendarSignUpPage2(),
      goTo: GoToCalendarSignUpPage4(),
    );
  }
}

Widget generateCheckBox(
    {@required String title,
    @required bool value,
    @required Function onChange}) {
  return SizedBox(
    child: Row(
      children: [
        UIHelper.horzSpace(10),
        Theme(
          data: ThemeData(unselectedWidgetColor: UIHelper.colorGreyLight),
          child: Checkbox(
              value: value,
              onChanged: onChange,
              activeColor: UIHelper.colorPink),
        ),
        UIHelper.horzSpace(10),
        SizedBox(
          width: UIHelper.setResWidth(200),
          child: Text(
            title,
            style: UIHelper.greyLightFont
                .copyWith(fontSize: UIHelper.setResFontSize(15)),
          ),
        )
      ],
    ),
  );
}
