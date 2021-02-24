part of 'widgets.dart';

class PlasmaDefaultTemplate extends StatelessWidget {
  final Widget child;
  final bool addHeader;
  final String desc;
  final PageEvent backTo;
  final PageEvent goTo;
  final double space;
  final bool isEnabled;
  final bool withPinkButton;
  final String pinkButtonTitle;
  final String header;
  final Function onPinkButtonTap;

  PlasmaDefaultTemplate(this.child,
      {this.addHeader = true,
      this.desc = "",
      @required this.backTo,
      @required this.goTo,
      this.space = 38,
      this.isEnabled = true,
      this.withPinkButton = true,
      this.header = "",
      this.pinkButtonTitle = "Lanjut",
      this.onPinkButtonTap});

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
                                            child: Text(header,
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
                      (withPinkButton)
                          ? PinkButton(
                              pinkButtonTitle,
                              () {
                                if (goTo != null) {
                                  pageBloc.add(goTo);
                                }
                                if (onPinkButtonTap != null) {
                                  onPinkButtonTap();
                                }
                              },
                              isEnabled: isEnabled,
                            )
                          : Container(),
                      (withPinkButton) ? UIHelper.vertSpace(20) : Container(),
                    ],
                  )
                ],
              ),
              TopBar("Plasma", () {
                pageBloc.add(backTo);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
