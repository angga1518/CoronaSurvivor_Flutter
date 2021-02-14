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
