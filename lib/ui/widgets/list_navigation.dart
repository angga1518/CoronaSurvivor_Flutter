part of 'widgets.dart';

class ListNavigationContainer extends StatelessWidget {
  final String golDarah;
  final String nama;
  final String provinsi;
  final Function onTap;
  final bool isProfil;

  ListNavigationContainer(this.nama, this.golDarah, this.provinsi, this.onTap,
      {this.isProfil = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: UIHelper.colorPinkSuperLight, width: 2)),
        child: Row(
          children: [
            (isProfil)
                ? Container(
                    margin: EdgeInsets.only(
                      left: UIHelper.setResWidth(10),
                      right: UIHelper.setResWidth(17),
                      top: UIHelper.setResHeight(10),
                      bottom: UIHelper.setResHeight(10),
                    ),
                    height: UIHelper.setResHeight(32),
                    width: UIHelper.setResWidth(32),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: UIHelper.colorMainLightRed),
                    child: Center(
                      child: Text(
                        golDarah,
                        style: UIHelper.redFont.copyWith(
                            fontSize: UIHelper.setResFontSize(15),
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                : UIHelper.horzSpace(25),
            (isProfil)
                ? Column(
                    children: [
                      SizedBox(
                        width: UIHelper.setResWidth(185),
                        child: Text(
                          nama,
                          style: UIHelper.greyLightFont.copyWith(
                              fontSize: UIHelper.setResFontSize(12),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        width: UIHelper.setResWidth(185),
                        child: Text(
                          provinsi,
                          style: UIHelper.greyLightFont.copyWith(
                              fontSize: UIHelper.setResFontSize(12),
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  )
                : SizedBox(
                    width: UIHelper.setResWidth(185),
                    height: UIHelper.setResHeight(32),
                    child: Align(
                      alignment: Alignment.centerLeft,
                                          child: Text(
                        provinsi,
                        style: UIHelper.greyLightFont.copyWith(
                            fontSize: UIHelper.setResFontSize(13),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
            UIHelper.horzSpace(20),
            SizedBox(
              child: Image(
                image: AssetImage("assets/forward_grey.png"),
                width: UIHelper.setResWidth(7),
                height: UIHelper.setResHeight(14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
