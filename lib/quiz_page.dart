import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/gawlat_details_data.dart';
import 'package:newproject/luck_wheel.dart';
import 'package:newproject/marathon_quiz.dart';
import 'package:newproject/quiz.dart';
import 'package:newproject/ta7t_el_ta5t.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mapping_page2.dart';
import 'nashan.dart';


class Wasf_Elgawla extends StatefulWidget {
  late int matchnum,roundnum,leftteam,rightteam;
  String leftname,rightname;
  int mod=1;
  Wasf_Elgawla({required this.matchnum,required this.roundnum,required this.rightteam,required this.leftteam,required this.leftname,required this.rightname});
  @override
  _Wasf_ElgawlaState createState() => _Wasf_ElgawlaState();
}

class _Wasf_ElgawlaState extends State<Wasf_Elgawla> {
  Data_gawalat object=new Data_gawalat();
  late bool finished;late String winner;

  @override
  void initState() {
    if(widget.mod==1){
      if(widget.roundnum==5){
        finished=true;
        if(widget.leftteam>widget.rightteam){
          winner="Winner is "+widget.leftname;
        }else if(widget.rightteam>widget.leftteam){
          winner="Winner is "+widget.rightname;
        }else if(widget.leftteam==widget.rightteam){
          winner="Draw";
        }
      }else{
        finished=false;
      }
    }else if(widget.mod==2){
      if(widget.roundnum==6){
        finished=true;
      }else{
        finished=false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return finished? Center(
      child: Column(
        children: [
          SizedBox(height: 60,),
          Text(
            winner,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 80,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.none
              ),

          ),
          SizedBox(height: 30,),
          MaterialButton(onPressed:() async{
            SharedPreferences prefs=await SharedPreferences.getInstance();
            int? leftscore=prefs.getInt(widget.leftname);
            int? rightscore=prefs.getInt(widget.rightname);
            int left=leftscore!+widget.leftteam;
            int right=rightscore!+widget.rightteam;
            prefs.setInt(widget.leftname, left);
            prefs.setInt(widget.rightname, right);
            Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext)=>Mapping_Page2()));
          },
          color: Colors.blue,
          child: Text("Done",style: TextStyle(color: Colors.white,fontSize: 25),),
          )
        ],
      ),
    ):Scaffold(
      appBar: new AppBar(
        title: Text(object.titles[widget.roundnum],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:AssetImage("assets/background.jpeg"),
                fit: BoxFit.cover)
        ),
        child: ListView(
          children: [
            Container(
              child: Text(object.names[widget.roundnum],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 70,color: Colors.white)),
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(170, 20, 170, 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                  border: Border.all(color: Colors.black,width: 2)
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
              alignment: Alignment.center,
              child: Text(object.details[widget.roundnum],
                textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white),textAlign: TextAlign.start,),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(400, 0, 400, 10),
              child: MaterialButton(onPressed: (){
                if(widget.roundnum==0){
                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>Quiz_Page(matchnum: widget.matchnum,roundnum: widget.roundnum,leftteam: widget.leftteam,rightteam: widget.rightteam,leftname: widget.leftname,rightname: widget.rightname,)));
                }else if(widget.roundnum==1){
                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>Marathon_Page(matchnum: widget.matchnum,roundnum: widget.roundnum,leftteam: widget.leftteam,rightteam: widget.rightteam,leftname: widget.leftname,rightname: widget.rightname,)));
                }else if(widget.roundnum==2){
                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>Nashan_Page(matchnum: widget.matchnum,roundnum: widget.roundnum,leftteam: widget.leftteam,rightteam: widget.rightteam,leftname: widget.leftname,rightname: widget.rightname,)));
                }
                else if(widget.roundnum==3){
                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>Ta7t_El_Da5t_Page(matchnum: widget.matchnum,roundnum: widget.roundnum,leftteam: widget.leftteam,rightteam: widget.rightteam,leftname: widget.leftname,rightname: widget.rightname,)));
                }
                else if(widget.roundnum==4){
                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>Luck_Wheel_Page(matchnum: widget.matchnum,roundnum: widget.roundnum,leftteam: widget.leftteam,rightteam: widget.rightteam,leftname: widget.leftname,rightname: widget.rightname,)));
                }

              },
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: Text("ابدأ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
