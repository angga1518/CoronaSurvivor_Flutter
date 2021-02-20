part of '../pages.dart';

class CalendarSignUpPage1 extends StatefulWidget {
  @override
  CalendarSignUpPage1State createState() => CalendarSignUpPage1State();
}

class CalendarSignUpPage1State extends State<CalendarSignUpPage1> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  String selectedGender;
  List<String> listGender = ["Laki - Laki", "Perempuan"];
  @override
  Widget build(BuildContext context) {
    return CalendarSignUpTemplate(
      SizedBox(
          child: Column(
        children: [
          generateTextField(
              namaController, "Nama Lengkap", "Nama Lengkap", false,
              value: "Muhammad Erlangga"),
          UIHelper.vertSpace(10),
          generateTextField(nikController, "NIK", "NIK", true),
          UIHelper.vertSpace(10),
          DropdownTextField(
              items: listGender,
              value: selectedGender,
              hintText: "Select Gender",
              onChange: (String value) {
                setState(() {
                  selectedGender = value;
                  print(selectedGender);
                });
              }),
        ],
      )),
      desc: "Lengkapi data diri Anda",
    );
  }
}

Widget generateTextField(TextEditingController controller, String labelText,
    String hintText, bool isEnabled,
    {String value = ""}) {
  controller.text = value;
  return SizedBox(
    height: UIHelper.setResHeight(40),
    width: UIHelper.setResWidth(270),
    child: TextField(
      textAlignVertical: TextAlignVertical.bottom,
      enabled: isEnabled,
      style: UIHelper.greyLightFont.copyWith(
          color: UIHelper.colorGreySuperLight,
          fontSize: UIHelper.setResFontSize(16)),
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: UIHelper.colorGreyLight, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: UIHelper.colorGreyLight,
        focusColor: UIHelper.colorGreyLight,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: "NIK",
        labelStyle: TextStyle(color: UIHelper.colorGreyLight),
        hintText: "NIK",
      ),
    ),
  );
}

Widget generateDropDownTextField(
    {@required List<String> items,
    @required String value,
    @required String hintText,
    @required Function onChange}) {
  return Container(
    height: UIHelper.setResHeight(40),
    width: UIHelper.setResWidth(270),
    padding: EdgeInsets.symmetric(horizontal: UIHelper.setResWidth(5)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: UIHelper.colorGreyLight, width: 1.0)),
    child: DropdownButton(
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down),
        hint: Text(hintText,
            style: UIHelper.greyLightFont.copyWith(
                color: UIHelper.colorGreySuperLight,
                fontSize: UIHelper.setResFontSize(16))),
        value: value,
        style: UIHelper.greyLightFont.copyWith(
            color: UIHelper.colorGreySuperLight,
            fontSize: UIHelper.setResFontSize(16)),
        items: items
            .map((value) => DropdownMenuItem(value: value, child: Text(value)))
            .toList(),
        onChanged: (value) {
          onChange(value);
          // setState(() {
          //   selectedGender = value;
          // });
        }),
  );
}
