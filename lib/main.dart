import 'package:atividade_fb/screens/my-home-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
