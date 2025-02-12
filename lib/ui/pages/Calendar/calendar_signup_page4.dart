part of '../pages.dart';

class CalendarSignUpPage4 extends StatefulWidget {
  CalendarModel calendarModel;
  CalendarSignUpPage4(this.calendarModel);
  @override
  CalendarSignUpPage4State createState() => CalendarSignUpPage4State();
}

class CalendarSignUpPage4State extends State<CalendarSignUpPage4> {
  List<Widget> children = [];
  List<String> listRiwayatPenyakit = [];
  TextEditingController newGejalaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index = children.length;
    return CalendarDefaultTemplate(
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
                                      listRiwayatPenyakit.removeAt(index);
                                      listRiwayatPenyakit.insert(index, "");
                                    });
                                  }));
                              listRiwayatPenyakit.add(newGejalaController.text);
                              newGejalaController.clear();
                            });
                          },
                          isEnabled: newGejalaController.text.length>0,
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
      onPinkButtonTap: () {
        List<String> fixListRiwayat = listRiwayatPenyakit;
        fixListRiwayat.remove("");
        widget.calendarModel.listRiwayat = fixListRiwayat;
      },
      isEnabled: children.length > 0,
      space: 10,
      desc: "Masukkan riwayat penyakit yang Anda miliki",
      backTo: GoToCalendarSignUpPage3(widget.calendarModel),
      goTo: GoToCalendarSignUpPage5(widget.calendarModel),
    );
  }
}

class IndexList extends StatelessWidget {
  final String text;
  Function onTap;
  IndexList({@required this.text, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              onTap();
            },
            child: SizedBox(
                height: UIHelper.setResHeight(15),
                width: UIHelper.setResWidth(15),
                child: Text(
                  "-",
                  style: UIHelper.greyLightFont.copyWith(
                      fontSize: UIHelper.setResFontSize(15),
                      fontWeight: FontWeight.w700),
                )),
          ),
          UIHelper.horzSpace(15),
          SizedBox(
            width: UIHelper.setResWidth(200),
            child: Text(
              text,
              style: UIHelper.greyLightFont
                  .copyWith(fontSize: UIHelper.setResFontSize(15)),
            ),
          )
        ],
      ),
    );
  }
}
