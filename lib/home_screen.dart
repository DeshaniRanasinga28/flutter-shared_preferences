import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sd_ex/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userName.dispose();
    password.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome!',
              style: TextStyle(
                  fontSize: 42.0,
                  fontFamily: 'Lora'
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            TextFormField(
              controller: userName,
              decoration: const InputDecoration(
                labelText: 'Username',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
                enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), ),
              ), ),

            const SizedBox(
              height: 20.0,
            ),

            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                labelText: 'Password',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)), enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), ),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                 if(userName.text == "abc" || password.text == "123"){
                   addUserDetailsToSF('abc', '123');
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const ProfileScreen()), );
                 }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600], shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2), ),
                ),
                child: const Text(
                  "OK",
                  style: TextStyle(color: Colors.white), ),
              ),
            )
          ],
        ),
      )
    );
  }

  addUserDetailsToSF(String? userName, String? password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', userName??'');
      await prefs.setString('password', password??'');
  }
}
