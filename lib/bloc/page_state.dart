part of 'page_bloc.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}

class OnSplashPage extends PageState {}

class OnLoginPage extends PageState {}

class OnSignupPage extends PageState {}

class OnHomePage extends PageState {}

class OnOnboardPage extends PageState {}

class OnProfilePage extends PageState {
  final Pengguna pengguna;
  OnProfilePage(this.pengguna);
}

class OnDonorGiverPage extends PageState {
  final Pengguna pengguna;
  final PemberiDonor pemberiDonor;
  OnDonorGiverPage(this.pengguna, this.pemberiDonor);
}

class OnDonorReceiverPage extends PageState {
  final Pengguna pengguna;
  final PenerimaDonor penerimaDonor;
  OnDonorReceiverPage(this.pengguna, this.penerimaDonor);
}

class OnInfoPage extends PageState {
  final Pengguna pengguna;
  final String idArtikel;
  final bool isLikedArtikel;
  final Map<String, bool> mapLikedKomentar;

  OnInfoPage(
      {this.pengguna,
      this.idArtikel,
      this.isLikedArtikel,
      this.mapLikedKomentar});
}

class OnDetailInfoPage extends PageState {
  final Pengguna pengguna;
  final Artikel artikel;
  final List<Komentar> listKomentar;
  bool tempIconLikeArtikel;

  OnDetailInfoPage(this.artikel, this.pengguna,
      {this.listKomentar, this.tempIconLikeArtikel});
}

class OnListProvinsi extends PageState {}

class OnAddCommentPage extends PageState {
  final Artikel artikel;
  final Pengguna pengguna;
  final bool isReply;
  final String namaReplied;
  final String idParentKomentar;
  final List<Komentar> listKomentar;

  OnAddCommentPage(this.artikel, this.pengguna, this.isReply, this.namaReplied,
      {this.listKomentar, this.idParentKomentar});
}

class OnCalendarOnboardPage extends PageState {
  final CalendarModel calendarModel;
  final Pengguna pengguna;
  OnCalendarOnboardPage(this.calendarModel, this.pengguna);
}

class OnCalendarSignUpPage1 extends PageState {
  final CalendarModel calendarModel;
  OnCalendarSignUpPage1(this.calendarModel);
}

class OnCalendarSignUpPage2 extends PageState {
  final CalendarModel calendarModel;
  OnCalendarSignUpPage2(this.calendarModel);
}

class OnCalendarSignUpPage3 extends PageState {
  final CalendarModel calendarModel;
  OnCalendarSignUpPage3(this.calendarModel);
}

class OnCalendarSignUpPage4 extends PageState {
  final CalendarModel calendarModel;
  OnCalendarSignUpPage4(this.calendarModel);
}

class OnCalendarSignUpPage5 extends PageState {
  final CalendarModel calendarModel;
  OnCalendarSignUpPage5(this.calendarModel);
}

class OnPlasmaPenerimaSignUp1 extends PageState {
  final Pengguna pengguna;
  final PenerimaDonor penerima;
  OnPlasmaPenerimaSignUp1(this.pengguna, this.penerima);
}

class OnPlasmaPenerimaSignUp2 extends PageState {
  final Pengguna pengguna;
  final PenerimaDonor penerima;
  OnPlasmaPenerimaSignUp2(this.pengguna, this.penerima);
}

class OnPlasmaPenerimaSignUp3 extends PageState {
  final Pengguna pengguna;
  final PenerimaDonor penerima;
  OnPlasmaPenerimaSignUp3(this.pengguna, this.penerima);
}

class OnPlasmaPenerimaSignUp4 extends PageState {
  final Pengguna pengguna;
  final PenerimaDonor penerima;
  OnPlasmaPenerimaSignUp4(this.pengguna, this.penerima);
}

class OnPlasmaPenerimaSignUp5 extends PageState {
  final Pengguna pengguna;
  final PenerimaDonor penerima;
  OnPlasmaPenerimaSignUp5(this.pengguna, this.penerima);
}

class OnPlasmaPendonorSignUp1 extends PageState {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  OnPlasmaPendonorSignUp1(this.pengguna, this.penerima);
}

class OnPlasmaPendonorSignUp2 extends PageState {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  OnPlasmaPendonorSignUp2(this.pengguna, this.penerima);
}

class OnPlasmaPendonorSignUp3 extends PageState {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  OnPlasmaPendonorSignUp3(this.pengguna, this.penerima);
}

class OnPlasmaPendonorSignUp4 extends PageState {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  OnPlasmaPendonorSignUp4(this.pengguna, this.penerima);
}

class OnPlasmaPendonorSignUp5 extends PageState {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  OnPlasmaPendonorSignUp5(this.pengguna, this.penerima);
}

class OnPlasmaPage extends PageState {
  final Pengguna pengguna;
  OnPlasmaPage(this.pengguna);
}

class OnPlasmaDetailPenerima extends PageState {
  final Pengguna pengguna;
  final PenerimaDonor penerimaDonor;
  OnPlasmaDetailPenerima(this.pengguna, this.penerimaDonor);
}

class OnPlasmaDetailPendonor extends PageState {
  final Pengguna pengguna;
  final PemberiDonor penerima;
  OnPlasmaDetailPendonor(this.pengguna, this.penerima);
}

// class OnCalendarHome extends PageState {}
class OnCalendarHome extends PageState {
  final CalendarModel calendarModel;
  OnCalendarHome(this.calendarModel);
}

class OnConnectPuskesmasPage extends PageState {
  final CalendarModel calendarModel;
  OnConnectPuskesmasPage(this.calendarModel);
}

class OnSuccessPage extends PageState {
  final String message;
  final String pinkButtonMessage;
  final PageEvent goTo;
  final PageEvent backTo;
  OnSuccessPage(this.message, this.goTo, this.backTo, this.pinkButtonMessage);
}

class OnRecoveryOnBoardPage extends PageState {
  final CalendarModel calendar;
  OnRecoveryOnBoardPage(this.calendar);
}

class OnAddRecoveryPage extends PageState {
  final CalendarModel calendar;
  OnAddRecoveryPage(this.calendar);
}

class OnAddNewGejalaPage extends PageState {
  final CalendarModel calendar;
  OnAddNewGejalaPage(this.calendar);
}

class OnRecoveryDetailPage extends PageState {
  final CalendarModel calendar;
  final Recovery recovery;
  OnRecoveryDetailPage(this.calendar, this.recovery);
}
