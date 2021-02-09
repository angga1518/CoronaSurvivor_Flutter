part of 'widgets.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String placeHolder;
  final Function onChanged;
  final bool isPassword;

  TextFieldWidget(
      this.label, this.placeHolder, this.onChanged, this.isPassword);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: UIHelper.responsive.setWidth(270),
        height: UIHelper.responsive.setHeight(40),
        child: TextField(
          obscureText: isPassword,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: placeHolder,
            hintText: label,
          ),
        ));
  }
}
