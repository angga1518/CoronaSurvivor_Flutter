part of '../pages.dart';

class CalendarSignUpPage2 extends StatefulWidget {
  CalendarModel calendarModel;
  CalendarSignUpPage2(this.calendarModel);
  @override
  CalendarSignUpPage2State createState() => CalendarSignUpPage2State();
}

class CalendarSignUpPage2State extends State<CalendarSignUpPage2> {
  TextEditingController beratBadanController = TextEditingController();
  TextEditingController tanggalPositifController = TextEditingController();
  TextEditingController tanggalGejalaController = TextEditingController();

  bool isAlreadyOpen = false;
  bool isBeratBadanValid = false;
  bool isBeratBadanOpened = false;
  bool isTanggalPositifValid = true;
  bool isTanggalMunculGejalaValid = true;

  @override
  void initState() {
    super.initState();
    beratBadanController.text = widget.calendarModel.beratBadan.toString();
    tanggalPositifController.text =
        widget.calendarModel.tanggalPositif.toString();
    tanggalGejalaController.text =
        widget.calendarModel.tanggalMunculGejala.toString();
    isAlreadyOpen = beratBadanController.text != "" ||
        tanggalPositifController.text != "" ||
        tanggalGejalaController.text != "";
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDefaultTemplate(
      SizedBox(
        child: Column(
          children: [
            TextFieldWidget(
              "yyyy/MM/dd",
              "Tanggal Positif",
              (value) {
                setState(() {
                  isAlreadyOpen = true;
                  isTanggalPositifValid = tanggalValidation(value);
                  widget.calendarModel.tanggalPositif = value;
                });
              },
              false,
              controller: tanggalPositifController,
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
                  isTanggalMunculGejalaValid = tanggalValidation(value);
                  widget.calendarModel.tanggalMunculGejala = value;
                });
              },
              false,
              controller: tanggalGejalaController,
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
                setState(() {
                  isBeratBadanOpened = true;
                  try {
                    widget.calendarModel.beratBadan =
                        int.parse(value.toString());
                    isBeratBadanValid = true;
                  } catch (e) {
                    isBeratBadanValid = false;
                  }
                });
              },
              false,
              controller: beratBadanController,
              isValid:
                  (beratBadanController.text.length > 0 && isBeratBadanValid) || !isBeratBadanOpened,
              errorText: (beratBadanController.text.length != 0) ? "Format tidak sesuai" : "Field harus diisi",
              isNumber: true,
            ),
          ],
        ),
      ),
      desc: "Lengkapi data diri Anda",
      goTo: GoToCalendarSignUpPage3(widget.calendarModel),
      backTo: GoToCalendarSignUpPage1(widget.calendarModel),
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
