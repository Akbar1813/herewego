import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herewego/pages/home_page.dart';
import 'package:herewego/pages/signIn_page.dart';
import 'package:herewego/pages/signUp_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const SignInPage(),
      routes: {
        SignInPage.Id: (context) => SignInPage(),
        HomePage.Id: (context) => HomePage(),
        SignUpPage.Id: (context) => SignUpPage()
      },
    );
  }
}