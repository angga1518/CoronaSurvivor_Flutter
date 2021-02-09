part of 'widgets.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String placeHolder;
  final Function onChanged;
  final bool isPassword;
  final bool isNumber;

  TextFieldWidget(this.label, this.placeHolder, this.onChanged, this.isPassword,
      {this.isNumber = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: UIHelper.responsive.setWidth(270),
        height: UIHelper.responsive.setHeight(40),
        child: TextField(
          keyboardType: isNumber ? TextInputType.phone: TextInputType.name,
          textAlignVertical: TextAlignVertical.bottom,
          obscureText: isPassword,
          onChanged: onChanged,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: UIHelper.colorGreyLight, width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: UIHelper.colorGreyLight,
            focusColor: UIHelper.colorGreyLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: placeHolder,
            labelStyle: TextStyle(color: UIHelper.colorGreyLight),
            hintText: label,
          ),
        ));
  }
}
