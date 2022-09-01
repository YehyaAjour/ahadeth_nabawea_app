import 'package:ahadeth_nabawea_app/utils/colors.dart';

import 'package:flutter/material.dart';
import '../utils/animate_do.dart';
import 'alhadith_screen.dart';
import 'custom_widget/custom_text.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = FlipCardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: CustomText('الأربعون النووية', fontSize: 30),
                  ),
                  GestureDetector(
                      onTap: () async{
                      await  controller.flipCard();
                         Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AhadithScreen()));
                      },
                      child: FlipCard(
                        controller: controller,
                        frontWidget: myCard(colorApp.blue2, colorApp.blue1, "الأحاديث الاربعين", "assets/quran.png",
                            'assets/svg/one.svg'),
                        backWidget: myCard(colorApp.blue2, colorApp.blue1, "الأحاديث الاربعين", "assets/quran.png",
                            'assets/svg/one.svg'),
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}

Widget myCard(
  Color color1,
  color2,
  String text,
  path1,
  path2,
) {
  return BounceInUp(
    animate: true,
    duration: Duration(milliseconds: 1500),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 48),
      child: Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(10, 10), blurRadius: 40)],
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(colors: [
                color1,
                color2,
              ], begin: AlignmentDirectional.topEnd, end: AlignmentDirectional.bottomStart)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(path1, width: 180, height: 180, fit: BoxFit.contain),
              CustomText(
                text,
               color: Colors.white, fontSize: 30,
              )
            ],
          )),
    ),
  );
}
