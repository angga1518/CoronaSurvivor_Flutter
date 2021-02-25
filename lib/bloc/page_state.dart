part of 'page_bloc.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}

class OnSplashPage extends PageState {}

class OnLoginPage extends PageState {}

class OnSignupPage extends PageState {}

class OnHomePage extends PageState {}

class OnOnboardPage extends PageState {}

class OnProfilePage extends PageState {}

class OnDonorGiverPage extends PageState {}

class OnDonorReceiverPage extends PageState {}

class OnInfoPage extends PageState {}

class OnDetailInfoPage extends PageState {
  final String idArtikel;
  final Pengguna pengguna;
  final String judul;

  OnDetailInfoPage(this.idArtikel, this.pengguna, this.judul);
}

class OnAddCommentPage extends PageState {
  final String title;
  final String idArtikel;
  final Pengguna pengguna;
  final bool isReply;
  final String repliedUser;

  OnAddCommentPage(this.title, this.idArtikel, this.pengguna, this.isReply,this.repliedUser);
}

class OnCalendarOnboardPage extends PageState {}

class OnCalendarSignUpPage1 extends PageState {}

class OnCalendarSignUpPage2 extends PageState {}

class OnCalendarSignUpPage3 extends PageState {}

class OnCalendarSignUpPage4 extends PageState {}

class OnCalendarSignUpPage5 extends PageState {}

class OnCalendarHome extends PageState {}

class OnConnectPuskesmasPage extends PageState {}

class OnSuccessPage extends PageState {
  final String message;
  final String pinkButtonMessage;
  final PageEvent goTo;
  final PageEvent backTo;
  OnSuccessPage(this.message, this.goTo, this.backTo, this.pinkButtonMessage);
}

class OnRecoveryOnBoardPage extends PageState {}

class OnAddRecoveryPage extends PageState {}

class OnAddNewGejalaPage extends PageState {}

class OnRecoveryDetailPage extends PageState {}
