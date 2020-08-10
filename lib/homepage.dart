import 'dart:convert';

import 'package:covid19tracker/datasource.dart';
import 'package:covid19tracker/pages/countrypage.dart';
import 'package:covid19tracker/panels/infopanel.dart';
import 'package:covid19tracker/panels/mostaffectedcountries.dart';
import 'package:covid19tracker/panels/worldwidepanel.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldWideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCoutryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCoutryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight), onPressed: (){
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
          })
        ],
        centerTitle: false,
        title: Text('COVID-19 TRACKER'),
      ),
    body: SingleChildScrollView(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          color: Colors.orange[100],
          child: Text(DataSource.quote,style: TextStyle(color: Colors.orange[800],fontWeight: FontWeight.bold,fontSize: 16),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Worldwide",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                },
                  child: Container(
                  decoration: BoxDecoration(
                    color: primaryBlack,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text("Regional",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
        ),
        worldData ==null?CircularProgressIndicator(): WorldWidePanel(worldData: worldData,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0,horizontal:15.0),
          child: Text("Most affected Countries",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 10,),
        countryData==null?Container(): MostAffectedPanel(countryData: countryData,),
        SizedBox(height: 30,),
        InfoPanel(),
        SizedBox(height: 20,),
        Center(child: Text("WE ARE TOGETHER IN FIGHT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
        SizedBox(height: 10,),
        Center(child: Text("MADE BY @DHRUVIL GOSALIA",style: TextStyle(fontWeight: FontWeight.bold),)),
        SizedBox(height: 30,),
        


      ],
    )),  
    );
  }
}