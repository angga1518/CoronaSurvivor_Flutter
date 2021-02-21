part of 'widgets.dart';

class CalendarSignUpTemplate extends StatelessWidget {
  final Widget child;
  final bool addHeader;
  final String desc;
  final PageEvent backTo;
  final PageEvent goTo;
  final double space;
  final bool isEnabled;

  CalendarSignUpTemplate(this.child,
      {this.addHeader = true,
      this.desc = "",
      @required this.backTo,
      @required this.goTo,
      this.space = 38,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        pageBloc.add(backTo);
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
                              UIHelper.vertSpace(space),
                              child
                            ],
                          )),
                      UIHelper.vertSpace(20),
                      PinkButton(
                        "Lanjut",
                        () {
                          if (goTo != null) {
                            pageBloc.add(goTo);
                          }
                        },
                        isEnabled: isEnabled,
                      ),
                      UIHelper.vertSpace(20),
                    ],
                  )
                ],
              ),
              TopBar("MyCalendar", () {
                pageBloc.add(backTo);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
