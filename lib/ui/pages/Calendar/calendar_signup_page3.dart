part of '../pages.dart';

class CalendarSignUpPage3 extends StatefulWidget {
  CalendarModel calendarModel;
  CalendarSignUpPage3(this.calendarModel);
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

  List<String> tempListGejala;

  @override
  void initState() {
    super.initState();
    if (widget.calendarModel.listGejala == null) {
      return;
    } 
    isDemam = widget.calendarModel.listGejala.contains("Demam") ? true : false;
    isBatuk = widget.calendarModel.listGejala.contains("Batuk") ? true : false;
    isHilangPenciuman =
        widget.calendarModel.listGejala.contains("Hilang Penciuman")
            ? true
            : false;
    isKurangPenciuman = widget.calendarModel.listGejala
            .contains("Kemampuan Penciuman Berkurang")
        ? true
        : false;
    isHilangPengecapan =
        widget.calendarModel.listGejala.contains("Hilang Pengecapan")
            ? true
            : false;
    isKurangPengecapan = widget.calendarModel.listGejala
            .contains("Kemampuan Pengecapan Berkurang")
        ? true
        : false;
    isBadanPegal =
        widget.calendarModel.listGejala.contains("Badan Pegal") ? true : false;
    isMeriang =
        widget.calendarModel.listGejala.contains("Meriang") ? true : false;
    isPusing =
        widget.calendarModel.listGejala.contains("Pusing") ? true : false;
    isMual = widget.calendarModel.listGejala.contains("Mual") ? true : false;
    isMuntah =
        widget.calendarModel.listGejala.contains("Muntah") ? true : false;
    isSeleraMakanBerkurang =
        widget.calendarModel.listGejala.contains("Selera Makan Berkurang")
            ? true
            : false;
    isSesakNafas =
        widget.calendarModel.listGejala.contains("Sesak Nafas") ? true : false;
    isSaturasiKecil =
        widget.calendarModel.listGejala.contains("Saturasi <95") ? true : false;
    isRadangTenggorokan =
        widget.calendarModel.listGejala.contains("Radang Tenggorokan")
            ? true
            : false;
    isMudahLelah =
        widget.calendarModel.listGejala.contains("Mudah Lelah") ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    tempListGejala = [];
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
      onPinkButtonTap: () {
        setGejala();
        widget.calendarModel.listGejala = tempListGejala;
      },
      bottomSpace: 70,
      space: 10,
      desc: "Masukkan gejala yang Anda alami",
      backTo: GoToCalendarSignUpPage2(widget.calendarModel),
      goTo: GoToCalendarSignUpPage4(widget.calendarModel),
    );
  }

  void setGejala() {
    if (isDemam == true) {
      tempListGejala.add("Demam");
    }
    if (isBatuk == true) {
      tempListGejala.add("Batuk");
    }
    if (isHilangPenciuman == true) {
      tempListGejala.add("Hilang Penciuman");
    }
    if (isKurangPenciuman == true) {
      tempListGejala.add("Kemampuan Penciuman Berkurang");
    }
    if (isHilangPengecapan == true) {
      tempListGejala.add("Hilang Pengecapan");
    }
    if (isKurangPengecapan == true) {
      tempListGejala.add("Kemampuan Pengecapan Berkurang");
    }
    if (isBadanPegal == true) {
      tempListGejala.add("Badan Pegal");
    }
    if (isMeriang == true) {
      tempListGejala.add("Meriang");
    }
    if (isPusing == true) {
      tempListGejala.add("Pusing");
    }
    if (isMual == true) {
      tempListGejala.add("Mual");
    }
    if (isMuntah == true) {
      tempListGejala.add("Muntah");
    }
    if (isSeleraMakanBerkurang == true) {
      tempListGejala.add("Selera Makan Berkurang");
    }
    if (isSesakNafas == true) {
      tempListGejala.add("Sesak Nafas");
    }
    if (isSaturasiKecil == true) {
      tempListGejala.add("Saturasi <95");
    }
    if (isRadangTenggorokan == true) {
      tempListGejala.add("Radang Tenggorokan");
    }
    if (isMudahLelah == true) {
      tempListGejala.add("Mudah Lelah");
    }
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
