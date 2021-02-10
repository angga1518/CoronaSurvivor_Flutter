part of 'widgets.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final String title;

  CardContainer(this.title, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 14, 12, 15),
            child: Row(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(right: UIHelper.responsive.setWidth(9)),
                  height: UIHelper.responsive.setHeight(24),
                  width: UIHelper.responsive.setWidth(24),
                  decoration: BoxDecoration(
                    color: UIHelper.colorSoftPink,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text(
                    "-",
                    style: UIHelper.redFont.copyWith(
                        fontSize: UIHelper.responsive.setSp(15),
                        fontWeight: FontWeight.w700),
                  )),
                ),
                Text(
                  title,
                  style: UIHelper.darkGreyFont,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(22, 0, 22, 21),
            child: child,
          )
        ],
      ),
      width: UIHelper.responsive.setWidth(322),
      margin: EdgeInsets.only(left: 19, right: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
    );
  }
}
