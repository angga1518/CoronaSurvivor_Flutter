part of '../pages.dart';

class PlasmaPendonorSignUp3 extends StatefulWidget {
  Pengguna pengguna;
  PemberiDonor penerima;
  PlasmaPendonorSignUp3(this.pengguna, this.penerima);
  @override
  _PlasmaPendonorSignUp3State createState() => _PlasmaPendonorSignUp3State();
}

class _PlasmaPendonorSignUp3State extends State<PlasmaPendonorSignUp3> {
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
    return PlasmaDefaultTemplate(
      SizedBox(
        child: Column(
          children: [
            generateCheckBox(
                title: "Demam",
                value: isDemam,
                onChange: (value) {
                  setState(() {
                    isDemam = value;
                    if (value) {
                      widget.penerima.gejala.add("Demam");
                    } else {
                      if (widget.penerima.gejala.contains("Demam")) {
                        widget.penerima.gejala.remove("Demam");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Batuk",
                value: isBatuk,
                onChange: (value) {
                  setState(() {
                    isBatuk = value;
                    if (value) {
                      widget.penerima.gejala.add("Batuk");
                    } else {
                      if (widget.penerima.gejala.contains("Batuk")) {
                        widget.penerima.gejala.remove("Batuk");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Hilang Penciuman",
                value: isHilangPenciuman,
                onChange: (value) {
                  setState(() {
                    isHilangPenciuman = value;
                    if (value) {
                      widget.penerima.gejala.add("Hilang Penciuman");
                    } else {
                      if (widget.penerima.gejala.contains("Hilang Penciuman")) {
                        widget.penerima.gejala.remove("Hilang Penciuman");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Kemampuan Penciuman Berkurang",
                value: isKurangPenciuman,
                onChange: (value) {
                  setState(() {
                    isKurangPenciuman = value;
                    if (value) {
                      widget.penerima.gejala
                          .add("Kemampuan Penciuman Berkurang");
                    } else {
                      if (widget.penerima.gejala
                          .contains("Kemampuan Penciuman Berkurang")) {
                        widget.penerima.gejala
                            .remove("Kemampuan Penciuman Berkurang");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Hilang Pengecapan",
                value: isHilangPengecapan,
                onChange: (value) {
                  setState(() {
                    isHilangPengecapan = value;
                    if (value) {
                      widget.penerima.gejala.add("Hilang Pengecapan");
                    } else {
                      if (widget.penerima.gejala
                          .contains("Hilang Pengecapan")) {
                        widget.penerima.gejala.remove("Hilang Pengecapan");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Kemampuan Pengecapan Berkurang",
                value: isKurangPengecapan,
                onChange: (value) {
                  setState(() {
                    isKurangPengecapan = value;
                    if (value) {
                      widget.penerima.gejala
                          .add("Kemampuan Pengecapan Berkurang");
                    } else {
                      if (widget.penerima.gejala
                          .contains("Kemampuan Pengecapan Berkurang")) {
                        widget.penerima.gejala
                            .remove("Kemampuan Pengecapan Berkurang");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Badan Pegal",
                value: isBadanPegal,
                onChange: (value) {
                  setState(() {
                    isBadanPegal = value;
                    if (value) {
                      widget.penerima.gejala.add("Badan Pegal");
                    } else {
                      if (widget.penerima.gejala.contains("Badan Pegal")) {
                        widget.penerima.gejala.remove("Badan Pegal");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Meriang",
                value: isMeriang,
                onChange: (value) {
                  setState(() {
                    isMeriang = value;
                    if (value) {
                      widget.penerima.gejala.add("Meriang");
                    } else {
                      if (widget.penerima.gejala.contains("Meriang")) {
                        widget.penerima.gejala.remove("Meriang");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Pusing",
                value: isPusing,
                onChange: (value) {
                  setState(() {
                    isPusing = value;
                    if (value) {
                      widget.penerima.gejala.add("Pusing");
                    } else {
                      if (widget.penerima.gejala.contains("Pusing")) {
                        widget.penerima.gejala.remove("Pusing");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Mual",
                value: isMual,
                onChange: (value) {
                  setState(() {
                    isMual = value;
                    if (value) {
                      widget.penerima.gejala.add("Mual");
                    } else {
                      if (widget.penerima.gejala.contains("Mual")) {
                        widget.penerima.gejala.remove("Mual");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Muntah",
                value: isMuntah,
                onChange: (value) {
                  setState(() {
                    isMuntah = value;
                    if (value) {
                      widget.penerima.gejala.add("Muntah");
                    } else {
                      if (widget.penerima.gejala.contains("Muntah")) {
                        widget.penerima.gejala.remove("Muntah");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Selera Makan berkurang",
                value: isSeleraMakanBerkurang,
                onChange: (value) {
                  setState(() {
                    isSeleraMakanBerkurang = value;
                    if (value) {
                      widget.penerima.gejala.add("Selera Makan berkurang");
                    } else {
                      if (widget.penerima.gejala
                          .contains("Selera Makan berkurang")) {
                        widget.penerima.gejala.remove("Selera Makan berkurang");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Sesak Nafas",
                value: isSesakNafas,
                onChange: (value) {
                  setState(() {
                    isSesakNafas = value;
                    if (value) {
                      widget.penerima.gejala.add("Sesak Nafas");
                    } else {
                      if (widget.penerima.gejala.contains("Sesak Nafas")) {
                        widget.penerima.gejala.remove("Sesak Nafas");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Saturasi <95",
                value: isSaturasiKecil,
                onChange: (value) {
                  setState(() {
                    isSaturasiKecil = value;
                    if (value) {
                      widget.penerima.gejala.add("Saturasi <95");
                    } else {
                      if (widget.penerima.gejala.contains("Saturasi <95")) {
                        widget.penerima.gejala.remove("Saturasi <95");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Radang Tenggorokan",
                value: isRadangTenggorokan,
                onChange: (value) {
                  setState(() {
                    isRadangTenggorokan = value;
                    if (value) {
                      widget.penerima.gejala.add("Radang Tenggorokan");
                    } else {
                      if (widget.penerima.gejala
                          .contains("Radang Tenggorokan")) {
                        widget.penerima.gejala.remove("Radang Tenggorokan");
                      }
                    }
                  });
                }),
            generateCheckBox(
                title: "Mudah Lelah",
                value: isMudahLelah,
                onChange: (value) {
                  setState(() {
                    isMudahLelah = value;
                    if (value) {
                      widget.penerima.gejala.add("Mudah Lelah");
                    } else {
                      if (widget.penerima.gejala.contains("Mudah Lelah")) {
                        widget.penerima.gejala.remove("Mudah Lelah");
                      }
                    }
                  });
                }),
            UIHelper.vertSpace(20)
          ],
        ),
      ),
      space: 10,
      desc: "Masukkan Gejala yang Anda alami",
      header: "Daftar Menjadi Penerima",
      goTo: GoToPlasmaPendonorSignUp4(widget.pengguna, widget.penerima),
      backTo: GoToPlasmaPendonorSignUp2(widget.pengguna, widget.penerima),
    );
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
}
