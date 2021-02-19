part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String dropdownKelamin = "Laki-Laki";

  var _kelaminSelectedValue = "";
  var _kelamin = ["Laki-Laki", "Perempuan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            color: UIHelper.colorDarkWhite,
            child: ListView(
              children: [
                SizedBox(
                  height: UIHelper.setResHeight(45),
                ),
                // CardContainer(Padding(
                //   padding: const EdgeInsets.only(right: 25, left: 25),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       SizedBox(
                //         height: UIHelper.setResHeight(30),
                //       ),
                //       Text(
                //         "Daftar",
                //         style: UIHelper.greyFont.copyWith(
                //             fontSize: UIHelper.setResFontSize(25),
                //             fontWeight: FontWeight.bold),
                //         textAlign: TextAlign.right,
                //       ),
                //       Text(
                //         "Masukkan data diri Anda",
                //         style: UIHelper.greyFont,
                //       ),
                //       SizedBox(
                //         height: UIHelper.setResHeight(30),
                //       ),
                //       Wrap(
                //         runSpacing: UIHelper.setResFontSize(20),
                //         children: [
                //           TextFieldWidget(
                //               "Nama Lengkap", "Nama Lengkap", null, false),
                //           DropdownButtonFormField(
                //             style: UIHelper.greyFont,
                //             decoration: InputDecoration(
                //               enabledBorder: OutlineInputBorder(
                //                 borderSide: BorderSide(
                //                     color: UIHelper.colorGreyLight, width: 1.0),
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //             ),
                //             isDense: true,
                //             isExpanded: true,
                //             items: <String>['Laki-Laki', 'Perempuan']
                //                 .map<DropdownMenuItem<String>>((String value) {
                //               return DropdownMenuItem<String>(
                //                 value: value,
                //                 child: Text(value),
                //               );
                //             }).toList(),
                //             onChanged: (String newValue) {
                //               setState(() {
                //                 dropdownKelamin = newValue;
                //               });
                //             },
                //             value: dropdownKelamin,
                //           ),
                //           TextFieldWidget(
                //               "Tanggal Lahir", "Tanggal Lahir", null, false),
                //           TextFieldWidget(
                //               "Jenis Kelamin", "Jenis Kelamin", null, false),
                //           TextFieldWidget("Domisili", "Domisili", null, false),
                //           TextFieldWidget(
                //             "Nomor Telepon",
                //             "Nomor Telepon",
                //             null,
                //             false,
                //             isNumber: true,
                //           ),
                //           TextFieldWidget("Email", "Email", null, false),
                //           TextFieldWidget("Password", "Password", null, true),
                //           TextFieldWidget("Konfirmasi Password",
                //               "Konfirmasi Password", null, true),
                //         ],
                //       )
                //     ],
                //   ),
                // )),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
