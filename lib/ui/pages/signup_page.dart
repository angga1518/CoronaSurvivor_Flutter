part of 'pages.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
            color: UIHelper.colorGreyBackground,
            child: ListView(
              children: [
                SizedBox(
                  height: UIHelper.responsive.setHeight(45),
                ),
                CardContainer(Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: UIHelper.responsive.setHeight(30),
                      ),
                      Text(
                        "Daftar",
                        style: UIHelper.greyFont.copyWith(
                            fontSize: UIHelper.responsive.setSp(25),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "Masukkan data diri Anda",
                        style: UIHelper.greyFont,
                      ),
                      SizedBox(
                        height: UIHelper.responsive.setHeight(30),
                      ),
                      Wrap(
                        runSpacing: UIHelper.responsive.setSp(20),
                        children: [
                          TextFieldWidget(
                              "Nama Lengkap", "Nama Lengkap", null, false),
                          DropdownButtonFormField(
                            style: UIHelper.greyFont,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: UIHelper.colorGreyLight, width: 1.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isDense: true,
                            isExpanded: true,
                            items: <String>['Laki-Laki', 'Perempuan']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownKelamin = newValue;
                              });
                            },
                            value: dropdownKelamin,
                          ),
                          TextFieldWidget(
                              "Tanggal Lahir", "Tanggal Lahir", null, false),
                          TextFieldWidget(
                              "Jenis Kelamin", "Jenis Kelamin", null, false),
                          TextFieldWidget("Domisili", "Domisili", null, false),
                          TextFieldWidget(
                            "Nomor Telepon",
                            "Nomor Telepon",
                            null,
                            false,
                            isNumber: true,
                          ),
                          TextFieldWidget("Email", "Email", null, false),
                          TextFieldWidget("Password", "Password", null, true),
                          TextFieldWidget("Konfirmasi Password",
                              "Konfirmasi Password", null, true),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
