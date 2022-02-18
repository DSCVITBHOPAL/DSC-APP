import 'package:dsc_client/authentication/GoogleSignIn.dart';
import 'package:dsc_client/authentication/SignInCheck.dart';
import 'package:dsc_client/authentication/Utils.dart';
import 'package:dsc_client/screens/splash.dart';
import 'package:dsc_client/utils/sharedPreferences.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/eventDetails/eventDetails.dart';
import 'screens/onBoardScreen/onBoardingPage.dart';
import '../authentication/Utils.dart';

bool isHomeScreen = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  isHomeScreen =
      await (CustomSharedPreferences.get("IS_FIRST_TIME_RUN")) ?? true;

  runApp(DSC());
}

class DSC extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
            scaffoldMessengerKey: Utils.messengerKey,
            debugShowCheckedModeBanner: false,
            //App Theming
            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.blue.shade300,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                color: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              drawerTheme:
                  DrawerThemeData(backgroundColor: Colors.grey.shade900),
              scaffoldBackgroundColor: Colors.black,
              primaryColor: Colors.blue.shade200,
              cardColor: Colors.grey.shade800,
              appBarTheme: AppBarTheme(
                color: Colors.black,
              ),
            ),
            themeMode: ThemeMode.system,
            title: 'DSC VITB',
            //Redirect to splash for first-time check
            home: splash()),
      );
}
