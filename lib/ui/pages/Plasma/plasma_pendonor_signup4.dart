part of '../pages.dart';

class PlasmaPendonorSignUp4 extends StatefulWidget {
  Pengguna pengguna;
  PemberiDonor penerima;
  PlasmaPendonorSignUp4(this.pengguna, this.penerima);
  @override
  _PlasmaPendonorSignUp4State createState() => _PlasmaPendonorSignUp4State();
}

class _PlasmaPendonorSignUp4State extends State<PlasmaPendonorSignUp4> {
  List<Widget> children = [];
  TextEditingController newGejalaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index = children.length;

    return PlasmaDefaultTemplate(
      Padding(
        padding: EdgeInsets.only(left: UIHelper.setResWidth(10)),
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: children,
                ),
              ),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: UIHelper.setResHeight(15),
                        width: UIHelper.setResWidth(15),
                        child: Text(
                          "+",
                          style: UIHelper.greyLightFont.copyWith(
                              fontSize: UIHelper.setResFontSize(15),
                              fontWeight: FontWeight.w700),
                        )),
                    UIHelper.horzSpace(15),
                    SizedBox(
                      width: UIHelper.setResWidth(170),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: newGejalaController,
                        style: UIHelper.greyLightFont
                            .copyWith(fontSize: UIHelper.setResFontSize(15)),
                        decoration: InputDecoration(
                            labelStyle:
                                TextStyle(color: UIHelper.colorGreyLight),
                            focusColor: UIHelper.colorGreyLight,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: UIHelper.colorGreyLight, width: 1.0),
                            )),
                        cursorColor: UIHelper.colorGreyLight,
                      ),
                    ),
                    UIHelper.horzSpace(15),
                    Column(
                      children: [
                        UIHelper.vertSpace(10),
                        PinkButton(
                          "Tambah",
                          () {
                            setState(() {
                              children.add(IndexList(
                                  text: newGejalaController.text,
                                  onTap: () {
                                    setState(() {
                                      children.removeAt(index);
                                      children.insert(index, Container());
                                      widget.penerima.riwayatPenyakit
                                          .remove(newGejalaController.text);
                                    });
                                  }));
                              widget.penerima.riwayatPenyakit
                                  .add(newGejalaController.text);
                              newGejalaController.clear();
                            });
                          },
                          height: 22,
                          fontSize: 10,
                          width: 62,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      space: 10,
      desc: "Masukkan riwayat penyakit yang Anda miliki",
      header: "Daftar Menjadi Penerima",
      goTo: GoToPlasmaPendonorSignUp5(widget.pengguna, widget.penerima),
      backTo: GoToPlasmaPendonorSignUp3(widget.pengguna, widget.penerima),
    );
  }
}
