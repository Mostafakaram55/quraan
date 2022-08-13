import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../const/const.dart';
class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel(
      //يتم استخدامه لحظه انشاء اوبجيكت
          {
        @required this.image,
        @required this.title,
        @required this.body,

      });
}

class OnBoarding extends StatelessWidget {


  List<BoardingModel>screen=[
    BoardingModel(
    image:'image/onboardingb.jpg' ,
      title: 'يَقِين',
      body:'الشَّاشَة الأَوَّلِيُّ فِي البَرْنامَج تَحْتَوِي عَلِيّ تَفَاصِيل البَرْنامَج ' ,
    ),
    BoardingModel(
      image: 'image/onboardinga.jpg',
      title: 'يَقِين',
      body: 'قِرَاءَةِ الْقُرْآنِ شِفَاءٌ للصدور ',
    ),
    BoardingModel(
      image: 'image/omquran.jpeg',
      title: 'يَقِين',
      body:'مَلْحُوظَة يُوجَد شاشَة لِمَعْرِفَة طَقْسِ اليَوْمِ '
      ,),
  ];
  var controller=PageController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: c,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: c,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    itemBuilder:(context,index)=>ItemBuilder(screen[index],context) ,
                  itemCount: screen.length,
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  scrollDirection: Axis.horizontal,

                  onPageChanged: (int index){
                      index==screen.length-1?Navigator.pushNamedAndRemoveUntil(context, 'rout1', (Route<dynamic>route) => false):print('F');
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmoothPageIndicator(
                    effect:ExpandingDotsEffect(
                      dotHeight: 10,
                      dotColor: Colors.white,
                      activeDotColor:  Color.fromRGBO(179, 117, 214, 1),
                      spacing: 5.0,
                      expansionFactor: 4,
                    ),
                    controller: controller,
                    count: screen.length,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget ItemBuilder(BoardingModel model,context)=>Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(child: Image.asset(
          model.image,
        height: 200,
        fit: BoxFit.cover,
      )),
      SizedBox(
        height: 10,
      ),
      Text(
        '${model.title}',
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        '${model.body}',
        textDirection: TextDirection.rtl,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),
      ),
    ],
  );
}
