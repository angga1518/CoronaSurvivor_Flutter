part of 'widgets.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  CardContainer(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: UIHelper.responsive.setWidth(322),
      margin: EdgeInsets.only(left: 19, right: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
    );
  }
}
