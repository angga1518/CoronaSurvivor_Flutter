part of '../pages.dart';

class CalendarSignUpPage4 extends StatefulWidget {
  @override
  CalendarSignUpPage4State createState() => CalendarSignUpPage4State();
}

class CalendarSignUpPage4State extends State<CalendarSignUpPage4> {
  List<Widget> children = [];

  @override
  void initState() {
    super.initState();
    children.add(IndexList(
        index: 0,
        text: "Radang Tenggorokan",
        onTap: () {
          setState(() { 
            children.removeAt(0);
          });
        }));
    children.add(IndexList(
        index: 1,
        text: "Radang Tenggorokan",
        onTap: () {
          setState(() {
            children.removeAt(1);
          });
        }));
    children.add(IndexList(
        index: 0,
        text: "Radang Tenggorokan",
        onTap: () {
          setState(() {
            children.removeAt(1);
          });
        }));
  }

  @override
  Widget build(BuildContext context) {
    return CalendarSignUpTemplate(
      SizedBox(
        child: Column(
          children: children,
        ),
      ),
      desc: "Masukkan riwayat penyakit yang Anda miliki",
      backTo: GoToCalendarSignUpPage3(),
      goTo: GoToCalendarSignUpPage5(),
    );
  }
}

class IndexList extends StatelessWidget {
  final int index;
  final String text;
  Function onTap;
  IndexList({@required this.index, @required this.text, @required this.onTap});
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