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

class GoToDetailInfoPage extends PageEvent {
  final Artikel artikel;
  final Pengguna pengguna;

  GoToDetailInfoPage(this.artikel, this.pengguna);
}

class GoToAddCommentPage extends PageEvent {
  final Artikel artikel;
  final Pengguna pengguna;
  final bool isReply;
  final String namaReplied;
  final String idParentKomentar;

  GoToAddCommentPage(
      this.artikel, this.pengguna, this.isReply, this.namaReplied,
      {this.idParentKomentar});
}

class GoToCalendarOnboardPage extends PageEvent {}

class GoToCalendarSignUpPage1 extends PageEvent {}

class GoToCalendarSignUpPage2 extends PageEvent {}

class GoToCalendarSignUpPage3 extends PageEvent {}

class GoToCalendarSignUpPage4 extends PageEvent {}

class GoToCalendarSignUpPage5 extends PageEvent {}

class GoToCalendarHome extends PageEvent {}

class GoToConnectPuskesmasPage extends PageEvent {}

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

class GoToRecoveryOnBoardPage extends PageEvent {}

class GoToAddRecoveryPage extends PageEvent {}

class GoToAddNewGejalaPage extends PageEvent {}

class GoToRecoveryDetailPage extends PageEvent {}
