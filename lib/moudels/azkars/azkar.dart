import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan/azkar_file.dart';
import 'package:quraan/conttrol/cubit.dart';
import 'package:quraan/conttrol/states.dart';
import 'package:quraan/model/azkar_app.dart';
import 'package:quraan/model/azkar_mpdel.dart';
import '../../const/const.dart';
class ELAZKAR extends StatelessWidget {
  var x={
    "data":[
      {

        "category":"أذكار الصباح",
        "id":1,
        "description":"",
        "reference":"",
        "content":"أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير"
      },
      {
        "category":"أذكار الصباح",
        "count":"1",
        "description":"من قالها موقنا بها حين يمسى ومات من ليلته دخل الجنة وكذلك حين يصبح.",
        "reference":"",
        "content":"اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ ."
      },
      {
        "category":"أذكار الصباح",
        "id":2,
        "description":"من قالها حين يصبح وحين يمسى كان حقا على الله أن يرضيه يوم القيامة.",
        "reference":"",
        "content":"رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً. "
      },
      {
        "category":"أذكار الصباح",
        "id":3,
        "description":"من قالها أعتقه الله من النار.",
        "reference":"",
        "content":"اللّهُـمَّ إِنِّـي أَصْبَـحْتُ أُشْـهِدُك ، وَأُشْـهِدُ حَمَلَـةَ عَـرْشِـك ، وَمَلَائِكَتَكَ ، وَجَمـيعَ خَلْـقِك ، أَنَّـكَ أَنْـتَ اللهُ لا إلهَ إلاّ أَنْـتَ وَحْـدَكَ لا شَريكَ لَـك ، وَأَنَّ ُ مُحَمّـداً عَبْـدُكَ وَرَسـولُـك."
      },
      {
        "category":"أذكار الصباح",
        "id":4,
        "description":"من قالها كفاه الله ما أهمه من أمر الدنيا والأخرة.",
        "reference":"",
        "content":"حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم."
      },
      {
        "category":"أذكار الصباح",
        "id":5,
        "description":"لم يضره من الله شيء.",
        "reference":"",
        "content":"بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم."
      },
      {
        "category":"أذكار الصباح",
        "id":6,
        "description":"",
        "reference":"",
        "content":"اللّهُـمَّ بِكَ أَصْـبَحْنا وَبِكَ أَمْسَـينا ، وَبِكَ نَحْـيا وَبِكَ نَمُـوتُ وَإِلَـيْكَ النُّـشُور."
      },
      {
        "category":"أذكار الصباح",
        "id":7,
        "description":"",
        "reference":"",
        "content":"أَصْبَـحْـنا عَلَى فِطْرَةِ الإسْلاَمِ، وَعَلَى كَلِمَةِ الإِخْلاَصِ، وَعَلَى دِينِ نَبِيِّنَا مُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ، وَعَلَى مِلَّةِ أَبِينَا إبْرَاهِيمَ حَنِيفاً مُسْلِماً وَمَا كَانَ مِنَ المُشْرِكِينَ."
      },
      {
        "category":"أذكار الصباح",
        "id":8,
        "description":"",
        "reference":"",
        "content":"سُبْحـانَ اللهِ وَبِحَمْـدِهِ عَدَدَ خَلْـقِه ، وَرِضـا نَفْسِـه ، وَزِنَـةَ عَـرْشِـه ، وَمِـدادَ كَلِمـاتِـه."
      },
      {
        "category":"أذكار الصباح",
        "id":9,
        "description":"",
        "reference":"",
        "content":"اللّهُـمَّ عافِـني في بَدَنـي ، اللّهُـمَّ عافِـني في سَمْـعي ، اللّهُـمَّ عافِـني في بَصَـري ، لا إلهَ إلاّ أَنْـتَ."
      },
      {
        "category":"أذكار الصباح",
        "id":10,
        "description":"",
        "reference":"",
        "content":"اللّهُـمَّ إِنّـي أَعـوذُ بِكَ مِنَ الْكُـفر ، وَالفَـقْر ، وَأَعـوذُ بِكَ مِنْ عَذابِ القَـبْر ، لا إلهَ إلاّ أَنْـتَ."
      },
      {
        "category":"أذكار الصباح",
        "id":11,
        "description":"",
        "reference":"",
        "content":"اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في الدُّنْـيا وَالآخِـرَة ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في ديني وَدُنْـيايَ وَأهْـلي وَمالـي ، اللّهُـمَّ اسْتُـرْ عـوْراتي وَآمِـنْ رَوْعاتـي ، اللّهُـمَّ احْفَظْـني مِن بَـينِ يَدَيَّ وَمِن خَلْفـي وَعَن يَمـيني وَعَن شِمـالي ، وَمِن فَوْقـي ، وَأَعـوذُ بِعَظَمَـتِكَ أَن أُغْـتالَ مِن تَحْتـي."
      },
      {
        "category":"أذكار الصباح",
        "id":12,
        "description":"",
        "reference":"",
        "content":"يَا حَيُّ يَا قيُّومُ بِرَحْمَتِكَ أسْتَغِيثُ أصْلِحْ لِي شَأنِي كُلَّهُ وَلاَ تَكِلْنِي إلَى نَفْسِي طَـرْفَةَ عَيْنٍ."
      },
      {
        "category":"أذكار الصباح",
        "id":13,
        "description":"",
        "reference":"",
        "content":"أَصْبَـحْـنا وَأَصْبَـحْ المُـلكُ للهِ رَبِّ العـالَمـين ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ خَـيْرَ هـذا الـيَوْم ، فَـتْحَهُ ، وَنَصْـرَهُ ، وَنـورَهُ وَبَـرَكَتَـهُ ، وَهُـداهُ ، وَأَعـوذُ بِـكَ مِـنْ شَـرِّ ما فـيهِ وَشَـرِّ ما بَعْـدَه."
      },
      {
        "category":"أذكار الصباح",
        "id":14,
        "description":"",
        "reference":"",
        "content":"اللّهُـمَّ عالِـمَ الغَـيْبِ وَالشّـهادَةِ فاطِـرَ السّماواتِ وَالأرْضِ رَبَّ كـلِّ شَـيءٍ وَمَليـكَه ، أَشْهَـدُ أَنْ لا إِلـهَ إِلاّ أَنْت ، أَعـوذُ بِكَ مِن شَـرِّ نَفْسـي وَمِن شَـرِّ الشَّيْـطانِ وَشِرْكِهِ ، وَأَنْ أَقْتَـرِفَ عَلـى نَفْسـي سوءاً أَوْ أَجُـرَّهُ إِلـى مُسْـلِم."
      },
      {
        "category":"أذكار الصباح",
        "id":15,
        "description":"",
        "reference":"",
        "content":"أَعـوذُ بِكَلِمـاتِ اللّهِ التّـامّـاتِ مِنْ شَـرِّ ما خَلَـق."
      },
      {
        "category":"أذكار الصباح",
        "id":16,
        "description":"من صلى على حين يصبح وحين يمسى ادركته شفاعتى يوم القيامة.",
        "reference":"",
        "content":"اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد."
      },
      {
        "category":"أذكار الصباح",
        "id":17,
        "description":"",
        "reference":"",
        "content":"اللَّهُمَّ إِنَّا نَعُوذُ بِكَ مِنْ أَنْ نُشْرِكَ بِكَ شَيْئًا نَعْلَمُهُ ، وَنَسْتَغْفِرُكَ لِمَا لَا نَعْلَمُهُ."
      },
      {
        "category":"أذكار الصباح",
        "id":18,
        "description":"",
        "reference":"",
        "content":"اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ الْهَمِّ وَالْحَزَنِ، وَأَعُوذُ بِكَ مِنْ الْعَجْزِ وَالْكَسَلِ، وَأَعُوذُ بِكَ مِنْ الْجُبْنِ وَالْبُخْلِ، وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ، وَقَهْرِ الرِّجَالِ."
      },
      {
        "category":"أذكار الصباح",
        "id":19,
        "description":"",
        "reference":"",
        "content":"أسْتَغْفِرُ اللهَ العَظِيمَ الَّذِي لاَ إلَهَ إلاَّ هُوَ، الحَيُّ القَيُّومُ، وَأتُوبُ إلَيهِ."
      },
      {
        "category":"أذكار الصباح",
        "id":20,
        "description":"",
        "reference":"",
        "content":"يَا رَبِّ , لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلَالِ وَجْهِكَ , وَلِعَظِيمِ سُلْطَانِكَ."
      },
      {
        "category":"أذكار الصباح",
        "id":21,
        "description":"",
        "reference":"",
        "content":"اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا."
      },
      {
        "category":"أذكار الصباح",
        "id":22,
        "description":"كانت له عدل عشر رقاب، وكتبت له مئة حسنة، ومحيت عنه مئة سيئة، وكانت له حرزا من الشيطان.",
        "reference":"",
        "content":"لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءِ قَدِيرِ."
      },
      {
        "category":"أذكار الصباح",
        "id":23,
        "description":"حُطَّتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ. لَمْ يَأْتِ أَحَدٌ يَوْمَ الْقِيَامَةِ بِأَفْضَلَ مِمَّا جَاءَ بِهِ إِلَّا أَحَدٌ قَالَ مِثْلَ مَا قَالَ أَوْ زَادَ عَلَيْهِ.",
        "reference":"",
        "content":"سُبْحـانَ اللهِ وَبِحَمْـدِهِ."
      },
      {
        "category":"أذكار الصباح",
        "id":24,
        "description":"مائة حسنة، ومُحيت عنه مائة سيئة، وكانت له حرزاً من الشيطان حتى يمسى.",
        "reference":"",
        "content":"أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ"
      }
    ]
  };
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<Quraan,ShopState>(
      listener: (context,stata){},
      builder:(context,state){
        Quraan cubit=Quraan.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor:c,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor:c ,
              title:  Text(
                '${x['data'][0]['category']} 🌤',
                style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ) ,
            ),
            body: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              height: double.infinity,
              color: c,
              child:ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>SizedBox(
                  height: 15,
                ),
                itemBuilder:(context,index)=>Material(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft:Radius.circular(15),
                  ),
                  color: cubit.colors[cubit.colorNumber],
                  elevation: 7,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${x['data'][index]['content']}',
                              maxLines: 4,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                wordSpacing: 2,
                                fontFamily: 'UthmanicHafs',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Material(
                                  elevation: 9,
                                  color: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: c.withOpacity(.8),
                                    child: Icon(
                                      Icons.save_alt_rounded,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                Material(
                                  elevation: 9,
                                  color: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: c.withOpacity(.8),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                Material(
                                  elevation: 9,
                                  color: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: c.withOpacity(.8),
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ) ,
                  ),
                ),
                itemCount: x['data'].length,
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              elevation: 30.0,
              notchMargin: 9.0,
              child: Container(
                  width: double.infinity,
                  height: 110,
                  color: c,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder:(context,index){
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 11, right: 11, top: 50, bottom: 15),
                        child: InkWell(
                          onTap: (){
                            cubit.changeColorIndex(index);
                            cubit.chang=cubit.colors[index];
                            index=cubit.colorNumber;
                          },
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.12,
                            color: cubit.colors[index],
                            child: cubit.colorNumber==index?Icon(Icons.done):null,
                          ),
                        ),
                      );
                    },
                    itemCount: cubit.colors.length,
                  )
              ),
            ),
          ),
        );
      },
    );
  }
}
