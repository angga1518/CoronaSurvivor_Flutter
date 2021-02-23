import 'dart:io';

import 'package:corona_survivor_flutter/bloc/blocs.dart';
import 'package:corona_survivor_flutter/models/models.dart';
import 'package:corona_survivor_flutter/services/services.dart';
import 'package:corona_survivor_flutter/shared/shared.dart';
import 'package:corona_survivor_flutter/ui/shared/shared_ui.dart';
import 'package:corona_survivor_flutter/ui/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

part 'wrapper.dart';
part 'main_page.dart';
part 'splash_page.dart';
part 'login_page.dart';
part 'home_page.dart';
part 'onboard_page.dart';
part 'onboard_page1.dart';
part 'onboard_page2.dart';
part 'onboard_page3.dart';
part 'onboard_page4.dart';
part 'profile_page.dart';
part 'signup_page.dart';
part 'donor_giver_page.dart';
part 'donor_receiver_page.dart';
part 'info_page.dart';
part 'detail_info.dart';
part 'add_comment_page.dart';
part 'Calendar/calendar_onboard_page.dart';
part 'Calendar/calendar_signup_page1.dart';
part 'Calendar/calendar_signup_page2.dart';
part 'Calendar/calendar_signup_page3.dart';
part 'Calendar/calendar_signup_page4.dart';
part 'Calendar/calendar_signup_page5.dart';
part 'Calendar/calendar_home_page.dart';
part 'Calendar/calendar_connect_puskes_page.dart';
part 'Recovery/recovery_onboard_page.dart';
part 'Recovery/add_new_gejala_page.dart';
part 'Recovery/add_recovery_page.dart';
part 'Recovery/recovery_detail_page.dart';
part 'success_page.dart';