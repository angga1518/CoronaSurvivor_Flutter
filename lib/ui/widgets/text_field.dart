part of 'widgets.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String placeHolder;
  final Function onChanged;
  final bool isPassword;
  final bool isNumber;
  final bool isDate;
  final bool isEmail;
  final String errorText;
  final bool isValid;
  final Icon suffixIcon;
  final String prefixText;

  TextFieldWidget(this.label, this.placeHolder, this.onChanged, this.isPassword,
      {this.isNumber = false,
      this.isDate = false,
      this.isEmail = false,
      this.errorText,
      this.isValid = false,
      this.suffixIcon,
      this.prefixText = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: UIHelper.setResWidth(270),
        height: UIHelper.setResHeight(60),
        child: TextField(
          keyboardType: isNumber
              ? TextInputType.phone
              : isDate
                  ? TextInputType.datetime
                  : isEmail ? TextInputType.emailAddress : TextInputType.name,
          textAlignVertical: TextAlignVertical.center,
          obscureText: isPassword,
          onChanged: (value) {
            if (onChanged != null) {
              onChanged(value);
            }
          },
          decoration: InputDecoration(
            prefixText: prefixText == "" ? null : prefixText,
            suffixIcon: suffixIcon ?? null,
            contentPadding: EdgeInsets.symmetric(
                vertical: UIHelper.setResHeight(10),
                horizontal: UIHelper.setResWidth(10)),
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
            errorText: (isValid) ? null : errorText,
            labelText: placeHolder,
            labelStyle: TextStyle(color: UIHelper.colorGreyLight),
            hintText: label,
          ),
        ));
  }
}
