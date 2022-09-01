import 'package:ahadeth_nabawea_app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class HadithDetailItem extends StatelessWidget {
final String title;
final String text;

   HadithDetailItem({this.text, this.title}) ;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: colorApp.offWhite),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorApp.blue2),
                child: CustomText(title,color: Colors.white,),
              ),
              SizedBox(height: 5,),
              _convertHadith(context, text),
            ],
          ),
        ),
        SizedBox(height: 30,)
      ],
    );
  }
  RichText _convertHadith(BuildContext context, String text) {
    text = text.replaceAll('(', '{');
    text = text.replaceAll(')', '}');

    List<String> split = text.split(RegExp("{"));

    List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
      var texts = e.split("}");

      if (texts.length > 1) {
        return List.from(t)..addAll(["{${texts.first}}", "${e.substring(texts.first.length + 1)}"]);
      }
      return List.from(t)..add("{${texts.first}");
    });

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
            fontSize: 20, color: Colors.brown, height: 2.4, fontWeight: FontWeight.bold, fontFamily: 'din'),
        //style: DefaultTextStyle.of(context).style,
        children: [TextSpan(text: split.first)]..addAll(hadiths
            .map((text) => text.contains("{")
            ? TextSpan(
            text: text,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'din',
            ))
            : TextSpan(
            text: text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'din',
            )))
            .toList()),
      ),
      textDirection: TextDirection.rtl,
    );
  }

}
