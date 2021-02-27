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
  final String suffixText;
  final String helperText;
  final bool editable;
  final TextEditingController controller;

  TextFieldWidget(this.label, this.placeHolder, this.onChanged, this.isPassword,
      {this.isNumber = false,
      this.isDate = false,
      this.isEmail = false,
      this.errorText,
      this.isValid = true,
      this.suffixIcon,
      this.prefixText = "",
      this.suffixText = "",
      this.editable = true,
      this.controller,
      this.helperText = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: UIHelper.setResWidth(270),
        height: UIHelper.setResHeight(60),
        child: TextField(
          style: UIHelper.greyLightFont
              .copyWith(fontSize: UIHelper.setResFontSize(15)),
          cursorColor: UIHelper.colorGreyLight,
          controller: controller,
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
            helperStyle: TextStyle(color: UIHelper.colorGreySuperLight),
            helperText: helperText == "" ? null : helperText,
            prefixText: prefixText == "" ? null : prefixText,
            suffixText: suffixText == "" ? null : suffixText,
            suffixIcon: suffixIcon ?? null,
            contentPadding: EdgeInsets.symmetric(
                vertical: UIHelper.setResHeight(10),
                horizontal: UIHelper.setResWidth(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIHelper.colorGreyLight, width: 1.0),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: UIHelper.colorGreyLight, width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: !editable,
            fillColor: UIHelper.colorGreySuperLight2.withOpacity(0.5),
            focusColor: UIHelper.colorGreyLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            errorText: (isValid) ? null : errorText,
            labelText: placeHolder,
            labelStyle: TextStyle(color: UIHelper.colorGreyLight),
            hintText: label,
            enabled: editable,
          ),
        ));
  }
}
