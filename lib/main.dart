import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcbapp/utils/constants.dart';
import 'package:newcbapp/utils/routes.dart';
import 'models/cubit/google_sign_in/google_sign_in_cubit.dart';
import 'screens/splash_to_signup/first_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleSignInCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chai Bun',
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFF2a180d),
            appBarTheme: const AppBarTheme(
              color: kMainColor,
              elevation: 0,
              centerTitle: true,
            )),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
