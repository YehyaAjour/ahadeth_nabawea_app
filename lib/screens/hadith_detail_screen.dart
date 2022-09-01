import 'package:ahadeth_nabawea_app/screens/custom_widget/custom_text.dart';
import 'package:ahadeth_nabawea_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/hadithe.dart';
import 'custom_widget/hadith_detail_item.dart';
import 'local_audio.dart';

class HadithDetailScreen extends StatefulWidget {
  final Hadith hadith;

  HadithDetailScreen({this.hadith});

  @override
  State<HadithDetailScreen> createState() => _HadithDetailScreenState();
}

class _HadithDetailScreenState extends State<HadithDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 42,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                              CustomText('رجوع', fontWeight: FontWeight.normal),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: CustomText(widget.hadith.key + ' : ' + widget.hadith.nameHadith,
                            color: colorApp.blue2, fontWeight: FontWeight.bold, fontSize: 22, underline: true),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  LocalAudio(hadith: widget.hadith, localAudioPath: 'audio/' + widget.hadith.audioHadith),
                  const SizedBox(height: 20),
                  HadithDetailItem(title: 'نص الحديث',text: widget.hadith.textHadith),
                  HadithDetailItem(title: 'شرح الحديث',text: widget.hadith.explanationHadith),
                  HadithDetailItem(title: 'عن الراوي',text: widget.hadith.translateNarrator),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
