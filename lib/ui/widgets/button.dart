part of 'widgets.dart';

class ButtonUniversal extends StatelessWidget {

  final int height;
  final Function onTap;
  ButtonUniversal(this.height, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(
          "SignIn",
          style: UIHelper.testFont.copyWith(fontSize: 15),
        ),
        onPressed: (){
          onTap();
        },
      ),
    );
  }
}
