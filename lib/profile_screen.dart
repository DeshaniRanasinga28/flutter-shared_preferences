import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userNameValue;
  String? passwordValue;

  @override
  void initState() {
    getUserNameValuesSF();
    getPasswordValuesSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),),
      ),
      body: Center(
        child: Text("My Profile  $userNameValue   $passwordValue"),
      ),
    );
  }

  getUserNameValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userNameValue = prefs.getString('username');
    });
  }

  getPasswordValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
       passwordValue = prefs.getString('password');
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    prefs.remove("password");
  }
}
