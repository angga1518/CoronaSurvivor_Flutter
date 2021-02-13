import 'dart:async';

import 'package:bloc/bloc.dart';
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
    } else if (event is GotoSignupPage) {
      yield OnLoginPage();
    } else if (event is GoToDonorGiverPage) {
      yield OnDonorGiverPage();
    } else if (event is GoToDonorReceiverPage) {
      yield OnDonorReceiverPage();
    } else if (event is GoToInfoPage) {
      yield OnInfoPage();
    } else if (event is GoToDetailInfoPage) {
      yield OnDetailInfoPage();
    }
  }
}
