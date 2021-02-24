import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:corona_survivor_flutter/bloc/blocs.dart';
import 'package:corona_survivor_flutter/ui/pages/pages.dart';
import 'package:meta/meta.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToHomePage) {
      yield OnHomePage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToOnboardPage) {
      yield OnOnboardPage();
    } else if (event is GoToProfilePage) {
      yield OnProfilePage();
    } else if (event is GoToSignupPage) {
      yield OnSignupPage();
    } else if (event is GoToDonorGiverPage) {
      yield OnDonorGiverPage();
    } else if (event is GoToDonorReceiverPage) {
      yield OnDonorReceiverPage();
    } else if (event is GoToInfoPage) {
      yield OnInfoPage();
    } else if (event is GoToDetailInfoPage) {
      yield OnDetailInfoPage();
    } else if (event is GoToAddCommentPage) {
      yield OnAddCommentPage(event.title, event.component, event.isReply);
    } else if (event is GoToCalendarOnboardPage) {
      yield OnCalendarOnboardPage();
    } else if (event is GoToCalendarSignUpPage1) {
      yield OnCalendarSignUpPage1();
    } else if (event is GoToCalendarSignUpPage2) {
      yield OnCalendarSignUpPage2();
    } else if (event is GoToCalendarSignUpPage3) {
      yield OnCalendarSignUpPage3();
    } else if (event is GoToCalendarSignUpPage4) {
      yield OnCalendarSignUpPage4();
    } else if (event is GoToCalendarSignUpPage5) {
      yield OnCalendarSignUpPage5();
    } else if (event is GoToPlasmaPage) {
      yield OnPlasmaPage();
    } else if (event is GoToCalendarHome) {
      yield OnCalendarHome();
    } else if (event is GoToConnectPuskesmasPage) {
      yield OnConnectPuskesmasPage();
    } else if (event is GoToSuccessPage) {
      yield OnSuccessPage(
          event.message, event.goTo, event.backTo, event.pinkButtonMessage);
    } else if (event is GoToRecoveryOnBoardPage) {
      yield OnRecoveryOnBoardPage();
    } else if (event is GoToAddRecoveryPage) {
      yield OnAddRecoveryPage();
    } else if (event is GoToAddNewGejalaPage) {
      yield OnAddNewGejalaPage();
    } else if (event is GoToRecoveryDetailPage) {
      yield OnRecoveryDetailPage();
    } else if (event is GoToPlasmaPenerimaSignUp1) {
      yield OnPlasmaPenerimaSignUp1();
    } else if (event is GoToPlasmaPenerimaSignUp2) {
      yield OnPlasmaPenerimaSignUp2();
    } else if (event is GoToPlasmaPenerimaSignUp3) {
      yield OnPlasmaPenerimaSignUp3();
    } else if (event is GoToPlasmaPenerimaSignUp4) {
      yield OnPlasmaPenerimaSignUp4();
    } else if (event is GoToPlasmaPenerimaSignUp5) {
      yield OnPlasmaPenerimaSignUp5();
    } else if (event is GoToPlasmaPendonorSignUp1) {
      yield OnPlasmaPendonorSignUp1();
    } else if (event is GoToPlasmaPendonorSignUp2) {
      yield OnPlasmaPendonorSignUp2();
    } else if (event is GoToPlasmaPendonorSignUp3) {
      yield OnPlasmaPendonorSignUp3();
    } else if (event is GoToPlasmaPendonorSignUp4) {
      yield OnPlasmaPendonorSignUp4();
    } else if (event is GoToPlasmaPendonorSignUp5) {
      yield OnPlasmaPendonorSignUp5();
    }
  }
}
