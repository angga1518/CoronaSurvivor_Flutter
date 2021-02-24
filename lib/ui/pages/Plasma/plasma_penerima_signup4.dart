part of '../pages.dart';

class PlasmaPenerimaSignUp4 extends StatefulWidget {
  @override
  _PlasmaPenerimaSignUp4State createState() => _PlasmaPenerimaSignUp4State();
}

class _PlasmaPenerimaSignUp4State extends State<PlasmaPenerimaSignUp4> {
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
                                    });
                                  }));
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
      goTo: GoToPlasmaPenerimaSignUp5(),
      backTo: GoToPlasmaPenerimaSignUp3(),
    );
  }
}
