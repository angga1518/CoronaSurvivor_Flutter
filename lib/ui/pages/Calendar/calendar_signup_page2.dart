part of '../pages.dart';

class CalendarSignUpPage2 extends StatefulWidget {
  @override
  CalendarSignUpPage2State createState() => CalendarSignUpPage2State();
}

class CalendarSignUpPage2State extends State<CalendarSignUpPage2> {
  TextEditingController beratBadanController = TextEditingController();
  TextEditingController tanggalPositifController = TextEditingController();
  TextEditingController tanggalGejalaController = TextEditingController();

  bool isAlreadyOpen = false;
  bool isBeratBadanFieldOpen = false;
  bool isTanggalPositifValid = true;
  bool isTanggalMunculGejalaValid = true;

  String selectedGender;

  @override
  Widget build(BuildContext context) {
    return CalendarSignUpTemplate(
      SizedBox(
        child: Column(
          children: [
            TextFieldWidget(
              "yyyy/MM/dd",
              "Tanggal Positif",
              (value) {
                setState(() {
                  isAlreadyOpen = true;
                  tanggalPositifController.text = value;
                  isTanggalPositifValid = tanggalValidation(value);
                });
              },
              false,
              isValid: isTanggalPositifValid,
              errorText: "Format tidak sesuai",
              isDate: true,
              editable: true,
              suffixIcon: Icon(Icons.calendar_today),
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              "yyyy/MM/dd",
              "Tanggal Muncul Gejala",
              (value) {
                setState(() {
                  isAlreadyOpen = true;
                  tanggalGejalaController.text = value;
                  isTanggalMunculGejalaValid = tanggalValidation(value);
                });
              },
              false,
              isValid: isTanggalMunculGejalaValid,
              errorText: "Format tidak sesuai",
              isDate: true,
              editable: true,
              suffixIcon: Icon(Icons.calendar_today),
            ),
            UIHelper.vertSpace(5),
            TextFieldWidget(
              "Berat Badan",
              "Berat Badan",
              (value) {
                isBeratBadanFieldOpen = true;
                beratBadanController.text = value;
              },
              false,
              isValid: beratBadanController.text.length > 0 ||
                  !isBeratBadanFieldOpen,
              errorText: "Perlu diisi",
              isNumber: true,
            ),
          ],
        ),
      ),
      desc: "Lengkapi data diri Anda",
      goTo: GoToCalendarSignUpPage3(),
      backTo: GoToCalendarSignUpPage1(),
    );
  }

  bool tanggalValidation(String tanggal) {
    List<String> details = tanggal.split("/");
    if (details.length != 3) {
      return false;
    }
    if (details[0].length != 4) {
      return false;
    }
    if (details[1].length != 2) {
      return false;
    }
    if (details[2].length != 2) {
      return false;
    }
    return true;
  }
}
