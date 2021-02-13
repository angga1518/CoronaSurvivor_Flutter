part of 'widgets.dart';

class ArticleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: UIHelper.setResWidth(10),
          vertical: UIHelper.setResHeight(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: UIHelper.colorPinkSuperLight, width: 2)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: UIHelper.setResHeight(61),
                width: UIHelper.setResWidth(61),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
              ),
              UIHelper.horzSpace(14),
              Column(
                children: [
                  SizedBox(
                      width: UIHelper.setResWidth(180),
                      child: Text("Tata Cara Mencuci Hidung yang Benar",
                          style: UIHelper.greyLightFont.copyWith(
                              fontSize: UIHelper.setResFontSize(13),
                              fontWeight: FontWeight.w700))),
                  SizedBox(
                      width: UIHelper.setResWidth(180),
                      child: Text(
                        "Di masa pandemi ini, mencuci hidung dapat membantu mencegah Anda terjangkit virus Corona yang membadai terjangkan perahu",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: UIHelper.greyLightFont.copyWith(
                            fontSize: UIHelper.setResFontSize(10),
                            fontWeight: FontWeight.w400),
                      ))
                ],
              )
            ],
          ),
          UIHelper.vertSpace(6),
          Row(
            children: [
              Spacer(
                flex: 3,
              ),
              Expanded(
                  child: Row(
                children: [
                  Image(
                    image: AssetImage("assets/comment.png"),
                    width: UIHelper.setResWidth(13),
                    height: UIHelper.setResHeight(13),
                  ),
                  UIHelper.horzSpace(5),
                  Text("667",
                      style: UIHelper.greyLightFont.copyWith(
                          color: UIHelper.colorGreySuperLight,
                          fontSize: UIHelper.setResFontSize(10))),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Image(
                    image: AssetImage("assets/like.png"),
                    width: UIHelper.setResWidth(13),
                    height: UIHelper.setResHeight(13),
                  ),
                  UIHelper.horzSpace(5),
                  Text("200",
                      style: UIHelper.greyLightFont.copyWith(
                          color: UIHelper.colorGreySuperLight,
                          fontSize: UIHelper.setResFontSize(10))),
                ],
              )),
            ],
          )
        ],
      ),
    );
  }
}
