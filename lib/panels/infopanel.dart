import 'package:covid19tracker/datasource.dart';
import 'package:covid19tracker/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));
             },
             child: Container(
             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15), 
             margin: EdgeInsets.symmetric(vertical:5,horizontal: 15),
             color: primaryBlack,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text('FAQs',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                 Icon(Icons.arrow_forward,color: Colors.white,)
               ],
             ), 
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Container(
             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15), 
             margin: EdgeInsets.symmetric(vertical:5,horizontal: 15),
             color: primaryBlack,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text('MYTH BUSTERS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                 Icon(Icons.arrow_forward,color: Colors.white,)
               ],
             ), 
            ),
          )
        ],
      ),
    );
  }
}