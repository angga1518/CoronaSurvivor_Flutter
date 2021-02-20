part of 'widgets.dart';

class DropdownTextField extends StatefulWidget {
  List<String> items;
  String value;
  String hintText;
  Function onChange;
  DropdownTextField(
      {@required List<String> this.items,
      @required String this.value,
      @required String this.hintText,
      @required Function this.onChange});

  @override
  _DropdownTextStateField createState() => _DropdownTextStateField();
}

class _DropdownTextStateField extends State<DropdownTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIHelper.setResHeight(40),
      width: UIHelper.setResWidth(270),
      padding: EdgeInsets.symmetric(horizontal: UIHelper.setResWidth(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: UIHelper.colorGreyLight, width: 1.0)),
      child: DropdownButton(
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          hint: Text(widget.hintText,
              style: UIHelper.greyLightFont.copyWith(
                  fontSize: UIHelper.setResFontSize(15))),
          value: widget.value,
          style: UIHelper.greyLightFont.copyWith(
              fontSize: UIHelper.setResFontSize(15)),
          items: widget.items
              .map(
                  (value) => DropdownMenuItem(value: value, child: Text(value)))
              .toList(),
          onChanged: (value) {
            widget.onChange(value);
            widget.value = value;
          }),
    );
  }
}
