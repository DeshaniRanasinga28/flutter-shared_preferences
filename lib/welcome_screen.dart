import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.asset('assets/welcome_image.jpg'),
            const Text('Welcome!',
              style: TextStyle(
                fontSize: 42.0,
                fontFamily: 'Lora'
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Join with Us & Enjoy Health Life',
            style: TextStyle(
              fontFamily: 'Lora',
              fontSize: 14.0
            ),),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2)
                )
              ),
              child: const Text('OK',
                style: TextStyle(
                  color: Colors.white
                ),
              ),

            ),
          ],
        )
      ),
    );
  }
}

