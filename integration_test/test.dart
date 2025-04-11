import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:reel_radar/flutter_flow/flutter_flow_drop_down.dart';
import 'package:reel_radar/flutter_flow/flutter_flow_icon_button.dart';
import 'package:reel_radar/flutter_flow/flutter_flow_widgets.dart';
import 'package:reel_radar/flutter_flow/flutter_flow_theme.dart';
import 'package:reel_radar/index.dart';
import 'package:reel_radar/main.dart';
import 'package:reel_radar/flutter_flow/flutter_flow_util.dart';

import 'package:reel_radar/backend/firebase/firebase_config.dart';
import 'package:reel_radar/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('Recommendation Generation', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'test1@gmail.com', password: 'password');
    await tester.pumpWidget(MyApp(
      entryPage: HomescreenWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(find.byKey(const ValueKey('TextField_zfe2')),
        'Can you reccomend me a good movie?');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Button_zcl7')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    expect(find.byKey(const ValueKey('movieDisplay_s39s')), findsOneWidget);
  });

  testWidgets('ProfileTest', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: HomescreenWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.descendant(
      of: find.byKey(const ValueKey('NavBarWithMiddleButton_qcyi')),
      matching: find.byKey(const ValueKey('IconButton_wbry')),
    ));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.descendant(
      of: find.byKey(const ValueKey('NavBarWithMiddleButton_qcyi')),
      matching: find.byKey(const ValueKey('IconButton_wbry')),
    ));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('TextField_dmzt')), 'Test12Test');
    await tester.tap(find.byKey(const ValueKey('Button_sm66')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    expect(find.byKey(const ValueKey('Text_edit')), findsOneWidget);
  });

  testWidgets('User Login Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: HomePageWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('loginTab_1j6a')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('loginTab_1j6a')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(find.byKey(const ValueKey('email-login_ah1c')),
        'userlogintestemail@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(find.byKey(const ValueKey('password-login_4la7')),
        'userlogintestpassword');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('loginButton_8uea')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    expect(find.byKey(const ValueKey('NavBarWithMiddleButton_qcyi')),
        findsWidgets);
  });

  testWidgets('Testing Backend Calls', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'test1@gmail.com', password: 'password');
    await tester.pumpWidget(MyApp(
      entryPage: HomescreenWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.descendant(
      of: find.byKey(const ValueKey('NavBarWithMiddleButton_qcyi')),
      matching: find.byKey(const ValueKey('IconButton_wbry')),
    ));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    expect(find.byKey(const ValueKey('Text_z6i4')), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
