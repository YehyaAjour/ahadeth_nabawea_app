import 'package:ahadeth_nabawea_app/screens/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import '../db/mydata.dart';
import '../model/hadithe.dart';
import 'hadith_detail_screen.dart';

class AhadithScreen extends StatefulWidget {
  @override
  State<AhadithScreen> createState() => _AhadithScreenState();
}

class _AhadithScreenState extends State<AhadithScreen> {
  Widget ayah(String key, name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                key,
                fontSize: 16, color: Colors.black,
              ),
              SizedBox(height: 10,),
              CustomText(
                name,
               fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }

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
          FutureBuilder(
              //we call the method, which is in the folder db file database.dart
              future: Mydata.getAlldata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Hadith item = snapshot.data[index];
                      //delete one register for id
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HadithDetailScreen(
                                      hadith: item,
                                    )));
                          },
                          child: ayah(item.key, item.nameHadith));
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 130,
                      mainAxisSpacing: 3,
                      childAspectRatio: 2 / 2,
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}
