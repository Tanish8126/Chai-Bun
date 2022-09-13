import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newcbapp/screens/splash_to_signup/splash/splash_screen.dart';
import 'package:newcbapp/utils/routes.dart';
import 'models/cubit/google_sign_in/google_sign_in_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleSignInCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chai Bun',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF2a180d),
        ),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
