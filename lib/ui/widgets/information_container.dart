part of 'widgets.dart';

class InformationContainer extends StatelessWidget {
  final String component;
  final String data;

  InformationContainer(this.component, this.data);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          component,
          style: UIHelper.greyLightFont.copyWith(
              fontSize: UIHelper.setResFontSize(15),
              fontWeight: FontWeight.w700),
        )),
        Expanded(
            child: Text(
          data,
          style: UIHelper.greyLightFont.copyWith(
              fontSize: UIHelper.setResFontSize(15),
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.right,
        )),
      ],
    );
  }
}
