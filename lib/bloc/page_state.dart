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

class OnDetailInfoPage extends PageState {}

class OnAddCommentPage extends PageState {
  final String title;
  final String component;
  final bool isReply;

  OnAddCommentPage(this.title, this.component, this.isReply);
}

class OnCalendarOnboardPage extends PageState {}

class OnCalendarSignUpPage1 extends PageState {}

class OnCalendarSignUpPage2 extends PageState {}

class OnCalendarSignUpPage3 extends PageState {}

class OnCalendarSignUpPage4 extends PageState {}

class OnCalendarSignUpPage5 extends PageState {}

class OnPlasmaPenerimaSignUp1 extends PageState {}

class OnPlasmaPenerimaSignUp2 extends PageState {}

class OnPlasmaPenerimaSignUp3 extends PageState {}

class OnPlasmaPenerimaSignUp4 extends PageState {}

class OnPlasmaPenerimaSignUp5 extends PageState {}

class OnPlasmaPendonorSignUp1 extends PageState {}

class OnPlasmaPendonorSignUp2 extends PageState {}

class OnPlasmaPendonorSignUp3 extends PageState {}

class OnPlasmaPendonorSignUp4 extends PageState {}

class OnPlasmaPendonorSignUp5 extends PageState {}

class OnPlasmaPage extends PageState {}

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
