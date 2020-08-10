import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DONATE'),
      ),
    body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child: Column(
        children: <Widget>[
          Text('Pay Us by :',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Image.asset("images/googlepay.png",height: 70,),
          SizedBox(height: 20,),
          Center(child: Image.asset("images/googlepayqrcode.jpg",height: 200,)),
          SizedBox(height: 50,),
          Image.asset("images/paytm.png",height: 70,),
          SizedBox(height: 20,),
          Center(child: Image.asset("images/paytmqrcode.jpg",height: 200,)),
        SizedBox(height: 50,),
        Center(child: Text("WE ARE TOGETHER IN FIGHT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
        SizedBox(height: 10,),
        Center(child: Text("MADE BY @DHRUVIL GOSALIA",style: TextStyle(fontWeight: FontWeight.bold),)),
        SizedBox(height: 30,),
        ],
      ),
    ),  
    );
  }
}

