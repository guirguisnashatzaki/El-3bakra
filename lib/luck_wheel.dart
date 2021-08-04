import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/demo_screen.dart';

import 'package:newproject/quiz_page.dart';
import 'package:audioplayers/audioplayers.dart';

class Luck_Wheel_Page extends StatefulWidget {
  int matchnum,roundnum,leftteam,rightteam;
  String leftname,rightname;
  Luck_Wheel_Page({required this.matchnum,required this.roundnum,required this.leftteam,required this.rightteam,required this.leftname,required this.rightname});
  @override
  _Luck_Wheel_PageState createState() => _Luck_Wheel_PageState();
}

class _Luck_Wheel_PageState extends State<Luck_Wheel_Page> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PLAYING;
  late AudioCache audioCache;
  //marathondata object=new marathondata();
  int questionnum=0;
  late Timer timer;
  int time=5;
  bool myanswer=false,isjokerright=false,isjokerleft=false;
  String elegaba="الاجابة";
  String leftteam="Draw ",rightteam="Draw ";
  Color leftcolor=Colors.grey;
  Color rightcolor=Colors.grey;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
    score();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(time==1){
          timer.cancel();
          elegaba="الوقت انتهى";
          myanswer=true;
          time=time-1;
        }else{
          time=time-1;
        }
      });
    });
    super.initState();
  }

  void score(){
    setState(() {
      if(widget.leftteam>widget.rightteam){
        leftteam="Winner";
        rightteam="Loser";
        leftcolor=Colors.green;
        rightcolor=Colors.red;
      }else if(widget.leftteam<widget.rightteam){
        leftteam="Loser";
        rightteam="Winner";
        leftcolor=Colors.red;
        rightcolor=Colors.green;
      }else if(widget.leftteam==widget.rightteam){
        leftteam="Draw";
        rightteam="Draw";
        leftcolor=Colors.grey;
        rightcolor=Colors.grey;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.keyJ)){


          setState(() {
            if(isjokerright==false){
              isjokerright=true;
              audioPlayer.play("assets/joker.mp3");
            }else if(isjokerright==true){
              isjokerright=false;
            }
          });
        }
        if(event.isKeyPressed(LogicalKeyboardKey.keyK)){


          setState(() {
            if(isjokerleft==false){
              isjokerleft=true;
              audioPlayer.play("assets/joker.mp3");
            }else if(isjokerleft==true){
              isjokerleft=false;
            }
          });
        }
      },
      child: new Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage("assets/background.jpeg"),
                  fit: BoxFit.cover)
          ),
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                child: DemoScreen(leftteam: widget.leftteam,rightteam: widget.rightteam,roundnum: widget.roundnum,matchnum: widget.matchnum,),
              ),
              Positioned(
                bottom: 0,
                left: 50,
                child: Container(
                  width: 275,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    color: leftcolor,
                      image:isjokerleft? DecorationImage(
                          image: AssetImage("assets/fire.gif"),
                          fit: BoxFit.fill
                      ):null
                  ),
                  child: Column(
                    children: [
                      Text(widget.leftname,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          IconButton(onPressed: (){setState(() {if(widget.leftteam!=0){ widget.leftteam=widget.leftteam-5;}});score();}, icon: Icon(Icons.remove,color:Colors.white,size: 20,)),
                          SizedBox(width: 30,),
                          Container(child: Text("${widget.leftteam}",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),padding: EdgeInsets.all(20),),
                          SizedBox(width: 30,),
                          IconButton(onPressed: (){setState(() {widget.leftteam=widget.leftteam+5;});score();}, icon: Icon(Icons.add,color:Colors.white,size: 20,))
                        ],
                      ),
                      SizedBox(height: 70,)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 50,
                child: Container(
                  width: 275,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    color: rightcolor,
                      image:isjokerright? DecorationImage(
                          image: AssetImage("assets/fire.gif"),
                          fit: BoxFit.fill
                      ):null
                  ),
                  child: Column(
                    children: [
                      Text(widget.rightname,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          IconButton(onPressed: (){if(widget.rightteam!=0){setState(() {widget.rightteam=widget.rightteam-5;});}score();}, icon: Icon(Icons.remove,color:Colors.white,size: 20,)),
                          SizedBox(width: 30,),
                          Container(padding: EdgeInsets.all(20), child: Text("${widget.rightteam}",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold))),
                          SizedBox(width: 30,),
                          IconButton(onPressed: (){setState(() {widget.rightteam=widget.rightteam+5;});score();}, icon: Icon(Icons.add,color:Colors.white,size: 20,))
                        ],
                      ),
                      SizedBox(height: 70,)
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                  right: 0,
                  child: MaterialButton(
                    padding: EdgeInsets.all(20),
                      color: Colors.blue,
                      onPressed:(){
                        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>new Wasf_Elgawla(matchnum: widget.matchnum, roundnum: widget.roundnum+1,rightteam: widget.rightteam,leftteam: widget.leftteam,rightname: widget.rightname,leftname: widget.leftname,)));
                      },
                    child: Text("Next",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                  )
              )
            ],

          ),
        ),
      ),
    );
  }
}
