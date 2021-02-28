part of 'widgets.dart';

class ArticleContainer extends StatelessWidget {
  final Pengguna pengguna;
  final String idArtikel;
  final String judul;
  final String deskripsi;
  final int jumlahComment;
  final int jumlahLike;
  final String imgUrl;

  ArticleContainer(this.pengguna, this.idArtikel, this.judul, this.deskripsi,
      this.jumlahComment, this.jumlahLike, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return GestureDetector(
      onTap: () async {
        showPopUp(context: context, child: PopUpLoadingChild());
        Artikel artikel;
        artikel =
            await ArtikelServices.getArtikelDetails(idArtikel, pengguna.email)
                .whenComplete(() {
          Navigator.pop(context);
        });
        pageBloc.add(GoToDetailInfoPage(artikel, pengguna));
      },
      child: Container(
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
                      image: DecorationImage(
                          image: NetworkImage(imgUrl), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10)),
                ),
                UIHelper.horzSpace(14),
                Column(
                  children: [
                    SizedBox(
                        width: UIHelper.setResWidth(180),
                        child: Text(judul,
                            style: UIHelper.greyLightFont.copyWith(
                                fontSize: UIHelper.setResFontSize(13),
                                fontWeight: FontWeight.w700))),
                    SizedBox(
                        width: UIHelper.setResWidth(180),
                        child: Text(
                          deskripsi,
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
                    Text(jumlahComment.toString(),
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
                    Text(jumlahLike.toString(),
                        style: UIHelper.greyLightFont.copyWith(
                            color: UIHelper.colorGreySuperLight,
                            fontSize: UIHelper.setResFontSize(10))),
                  ],
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
