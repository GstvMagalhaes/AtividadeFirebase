import 'package:atividade_fb/screens/my-home-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'screens/main-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey:
            'AIzaSyD0y5RiJAFztejC51WxhQU-miScTJU2YTE', //LOCALIZADA NO GOOGLE-SERVICE.json => api_key['current_key']
        appId:
            '1:975757388115:android:3087466094c0846814d9a6', //ID DO APLICATIVO
        messagingSenderId: '975757388115', // NÚMERO DO PROJETO
        projectId: '975757388115' // NÚMERO DO PROJETO
        ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Carousel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/images/loading.json'),
      backgroundColor: Color.fromARGB(255, 24, 24, 24),
      nextScreen: const MainPage(),
      splashIconSize: 200,
      duration: 300,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
