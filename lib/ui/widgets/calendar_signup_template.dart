part of 'widgets.dart';

class CalendarSignUpTemplate extends StatelessWidget {
  final Widget child;
  final bool addHeader;
  final String desc;

  CalendarSignUpTemplate(this.child, {this.addHeader = true, this.desc = ""});

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        pageBloc.add(GoToCalendarOnboardPage());
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: UIHelper.colorDarkWhite,
              ),
              ListView(
                children: [
                  Column(
                    children: [
                      UIHelper.vertSpace(88),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: UIHelper.setResWidth(10),
                              vertical: UIHelper.setResHeight(10)),
                          width: UIHelper.setResWidth(322),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              (addHeader)
                                  ? SizedBox(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: UIHelper.setResWidth(280),
                                            child: Text("Buat MyCalendar",
                                                style: UIHelper.greyFont
                                                    .copyWith(
                                                        fontSize: UIHelper
                                                            .setResFontSize(20),
                                                        fontWeight:
                                                            FontWeight.w700)),
                                          ),
                                          UIHelper.vertSpace(3),
                                          SizedBox(
                                            width: UIHelper.setResWidth(280),
                                            child: Text(desc,
                                                style: UIHelper.greyLightFont
                                                    .copyWith(
                                                  fontSize:
                                                      UIHelper.setResFontSize(
                                                          13),
                                                )),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              UIHelper.vertSpace(38),
                              child
                            ],
                          )),
                      UIHelper.vertSpace(20),
                      PinkButton("Lanjut", () {}),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar("MyCalendar", () {
                pageBloc.add(GoToCalendarOnboardPage());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
