import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:herewego/pages/signIn_page.dart';
import 'package:herewego/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String Id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepOrange,
          ),
          child: TextButton(
            child: Text('Log Out',style: TextStyle(fontSize: 18,color: Colors.white),),
            onPressed: (){
              AuthService.signOutUser(context);
            },
          ),
        )
      ),
    );
  }
}
