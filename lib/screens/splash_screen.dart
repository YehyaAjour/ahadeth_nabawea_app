import 'dart:async';
import 'package:ahadeth_nabawea_app/screens/custom_widget/custom_text.dart';
import 'package:ahadeth_nabawea_app/utils/colors.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()
    {
      Navigator.of(context)

          .pushReplacement(MaterialPageRoute(builder: (_)=>HomePage()));//TODO ADD HOME SCREEN
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.1,
            child: Image.asset(
              "assets/background.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/quran.png', width: 170, height: 170, fit: BoxFit.contain),
                SizedBox(height: 30,),
                CustomText('أحاديث الأربعين النووية',fontSize: 40,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
