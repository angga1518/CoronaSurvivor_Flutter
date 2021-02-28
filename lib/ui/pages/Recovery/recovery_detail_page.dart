part of '../pages.dart';

class RecoveryDetailPage extends StatefulWidget {
  CalendarModel calendar;
  Recovery recovery;
  RecoveryDetailPage(this.calendar, this.recovery);
  @override
  _RecoveryDetailPageState createState() => _RecoveryDetailPageState();
}

class _RecoveryDetailPageState extends State<RecoveryDetailPage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return RecoveryTemplate(
      space: 16,
      child: SizedBox(
        child: Column(
          children: [
            (widget.recovery.status != 2)
                ? infoBanner(
                    title: (widget.recovery.status == 0)
                        ? "Belum terisi"
                        : (widget.recovery.status == 1)
                            ? "Tidak terhubung dengan puskesmas"
                            : "Sedang menunggu feedback puskesmas",
                    width: 230)
                : successBanner(title: "Sudah dibalas puskesmas", width: 230),
            UIHelper.vertSpace(16),
            borderContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saturasi",
                  style: UIHelper.greyLightFont.copyWith(
                      fontSize: UIHelper.setResFontSize(15),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  widget.recovery.saturasi,
                  style: UIHelper.greyLightFont.copyWith(
                      fontSize: UIHelper.setResFontSize(15),
                      fontWeight: FontWeight.w400),
                ),
                UIHelper.vertSpace(10),
                Text(
                  "Suhu Tubuh",
                  style: UIHelper.greyLightFont.copyWith(
                      fontSize: UIHelper.setResFontSize(15),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  widget.recovery.suhuTubuh,
                  style: UIHelper.greyLightFont.copyWith(
                      fontSize: UIHelper.setResFontSize(15),
                      fontWeight: FontWeight.w400),
                ),
                UIHelper.vertSpace(10),
                Text(
                  "Catatan Tambahan",
                  style: UIHelper.greyLightFont.copyWith(
                      fontSize: UIHelper.setResFontSize(15),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  widget.recovery.catatanTambahan,
                  style: UIHelper.greyLightFont.copyWith(
                      fontSize: UIHelper.setResFontSize(15),
                      fontWeight: FontWeight.w400),
                ),
                UIHelper.vertSpace(10),
              ],
            )),
            UIHelper.vertSpace(15),
            borderContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: generateUpdateGejalaWidget(),
            )),
            UIHelper.vertSpace(10),
          ],
        ),
      ),
      date: getTanggalFromDateTime(
          getDateTimeFromStringTanggal(widget.recovery.tanggalKalender)),
      backTo: GoToCalendarHome(widget.calendar),
      withPinkButton: false,
      onPinkButtonTap: null,
    );
  }

  List<Widget> generateUpdateGejalaWidget() {
    List<Widget> children = [];
    Recovery recovery = widget.recovery;
    for (var i = 0; i < widget.recovery.listUpdateGejala.length; i++) {
      children.add(Text(
        recovery.listNamaGejala[i],
        style: UIHelper.greyLightFont.copyWith(
            fontSize: UIHelper.setResFontSize(15), fontWeight: FontWeight.w700),
      ));
      children.add(Text(
        recovery.listUpdateGejala[i],
        style: UIHelper.greyLightFont.copyWith(
            fontSize: UIHelper.setResFontSize(15), fontWeight: FontWeight.w400),
      ));
      children.add(
        UIHelper.vertSpace(10),
      );
    }
    return children;
  }

  Widget infoBanner({double width = 250, @required String title}) {
    return Container(
        width: UIHelper.setResWidth(width),
        padding: EdgeInsets.symmetric(vertical: UIHelper.setResHeight(5)),
        decoration: BoxDecoration(
            color: UIHelper.colorSuperLightYellow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: UIHelper.colorLightYellow)),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: UIHelper.setResWidth(12)),
              child: Image(
                image: AssetImage('assets/info.png'),
                width: UIHelper.setResWidth(12.5),
                height: UIHelper.setResHeight(12.5),
              ),
            ),
            Container(
              width: UIHelper.setResWidth(width),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: UIHelper.yellowFont
                    .copyWith(fontSize: UIHelper.setResFontSize(10)),
              ),
            ),
          ],
        ));
  }

  Widget successBanner({double width = 250, @required String title}) {
    return Container(
        width: UIHelper.setResWidth(width),
        padding: EdgeInsets.symmetric(vertical: UIHelper.setResHeight(5)),
        decoration: BoxDecoration(
            color: UIHelper.colorLightMainGreen.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: UIHelper.colorMainGreen)),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: UIHelper.setResWidth(12)),
              child: Image(
                image: AssetImage('assets/success.png'),
                width: UIHelper.setResWidth(12.5),
                height: UIHelper.setResHeight(12.5),
              ),
            ),
            Container(
              width: UIHelper.setResWidth(width),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: UIHelper.greenFont
                    .copyWith(fontSize: UIHelper.setResFontSize(10)),
              ),
            ),
          ],
        ));
  }

  Widget borderContainer(Widget child) {
    return Container(
      width: UIHelper.setResWidth(265),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: UIHelper.colorPinkSuperLight)),
      padding: EdgeInsets.symmetric(
          vertical: UIHelper.setResHeight(10),
          horizontal: UIHelper.setResWidth(10)),
      child: child,
    );
  }
}
