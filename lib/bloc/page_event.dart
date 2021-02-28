part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}

class GoToSplashPage extends PageEvent {}

class GoToLoginPage extends PageEvent {}

class GoToSignupPage extends PageEvent {}

class GoToHomePage extends PageEvent {}

class GoToOnboardPage extends PageEvent {}

class GoToProfilePage extends PageEvent {
  final Pengguna pengguna;
  GoToProfilePage(this.pengguna);
}

class GoToDonorGiverPage extends PageEvent {
  final Pengguna pengguna;
  final PemberiDonor pemberiDonor;
  GoToDonorGiverPage(this.pengguna, this.pemberiDonor);
}

class GoToDonorReceiverPage extends PageEvent {
  final Pengguna pengguna;
  final PenerimaDonor penerimaDonor;
  GoToDonorReceiverPage(this.pengguna, this.penerimaDonor);
}

class GoToInfoPage extends PageEvent {}

class GoToDetailInfoPage extends PageEvent {}

class GoToAddCommentPage extends PageEvent {
  final String title;
  final String component;
  final bool isReply;

  GoToAddCommentPage(this.title, this.component, this.isReply);
}

class GoToCalendarOnboardPage extends PageEvent {
  CalendarModel calendarModel;
  final Pengguna pengguna;
  GoToCalendarOnboardPage(this.pengguna, {this.calendarModel});
}

class GoToCalendarSignUpPage1 extends PageEvent {
  final CalendarModel calendarModel;
  GoToCalendarSignUpPage1(this.calendarModel);
}

class GoToCalendarSignUpPage2 extends PageEvent {
  final CalendarModel calendarModel;
  GoToCalendarSignUpPage2(this.calendarModel);
}

class GoToCalendarSignUpPage3 extends PageEvent {
  final CalendarModel calendarModel;
  GoToCalendarSignUpPage3(this.calendarModel);
}

class GoToCalendarSignUpPage4 extends PageEvent {
  final CalendarModel calendarModel;
  GoToCalendarSignUpPage4(this.calendarModel);
}

class GoToCalendarSignUpPage5 extends PageEvent {
  final CalendarModel calendarModel;
  GoToCalendarSignUpPage5(this.calendarModel);
}

class GoToPlasmaPenerimaSignUp1 extends PageEvent {
  final Pengguna pengguna;
  final PenerimaDonor penerima;
  GoToPlasmaPenerimaSignUp1(this.pengguna, this.penerima);
}

class GoToPlasmaPenerimaSignUp2 extends PageEvent {
  final Pengguna pengguna;
  final PenerimaDonor penerima;
  GoToPlasmaPenerimaSignUp2(this.pengguna, this.penerima);
}

class GoToPlasmaPenerimaSignUp3 extends PageEvent {
  final Pengguna pengguna;
  final PenerimaDonor penerima;
  GoToPlasmaPenerimaSignUp3(this.pengguna, this.penerima);
}

class GoToPlasmaPenerimaSignUp4 extends PageEvent {
  final Pengguna pengguna;
  final PenerimaDonor penerima;
  GoToPlasmaPenerimaSignUp4(this.pengguna, this.penerima);
}

class GoToPlasmaPenerimaSignUp5 extends PageEvent {
  final Pengguna pengguna;
  final PenerimaDonor penerima;
  GoToPlasmaPenerimaSignUp5(this.pengguna, this.penerima);
}

class GoToPlasmaPendonorSignUp1 extends PageEvent {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  GoToPlasmaPendonorSignUp1(this.pengguna, this.penerima);
}

class GoToPlasmaPendonorSignUp2 extends PageEvent {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  GoToPlasmaPendonorSignUp2(this.pengguna, this.penerima);
}

class GoToPlasmaPendonorSignUp3 extends PageEvent {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  GoToPlasmaPendonorSignUp3(this.pengguna, this.penerima);
}

class GoToPlasmaPendonorSignUp4 extends PageEvent {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  GoToPlasmaPendonorSignUp4(this.pengguna, this.penerima);
}

class GoToPlasmaPendonorSignUp5 extends PageEvent {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  GoToPlasmaPendonorSignUp5(this.pengguna, this.penerima);
}

class GoToPlasmaPage extends PageEvent {
  final Pengguna pengguna;
  GoToPlasmaPage(this.pengguna);
}

class GoToPlasmaDetailPenerima extends PageEvent {
  final Pengguna pengguna;
  final PenerimaDonor penerimaDonor;
  GoToPlasmaDetailPenerima(this.pengguna, this.penerimaDonor);
}

class GoToPlasmaDetailPendonor extends PageEvent {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  GoToPlasmaDetailPendonor(this.pengguna, this.penerima);
}

// class GoToCalendarHome extends PageEvent {}
class GoToCalendarHome extends PageEvent {
  final CalendarModel calendarModel;
  GoToCalendarHome(this.calendarModel);
}

class GoToConnectPuskesmasPage extends PageEvent {
  final CalendarModel calendarModel;
  GoToConnectPuskesmasPage(this.calendarModel);
}

class GoToSuccessPage extends PageEvent {
  final String message;
  final String pinkButtonMessage;
  final PageEvent goTo;
  final PageEvent backTo;
  GoToSuccessPage(
      {@required this.message,
      @required this.goTo,
      @required this.backTo,
      @required this.pinkButtonMessage});
}

class GoToRecoveryOnBoardPage extends PageEvent {
  final CalendarModel calendar;
  GoToRecoveryOnBoardPage(this.calendar);
}

class GoToAddRecoveryPage extends PageEvent {
  final CalendarModel calendar;
  GoToAddRecoveryPage(this.calendar);
}

class GoToAddNewGejalaPage extends PageEvent {
  final CalendarModel calendar;
  GoToAddNewGejalaPage(this.calendar);
}

class GoToRecoveryDetailPage extends PageEvent {
  final CalendarModel calendar;
  final Recovery recovery;
  GoToRecoveryDetailPage(this.calendar, this.recovery);
}

class GoToListProvinsi extends PageEvent {}

