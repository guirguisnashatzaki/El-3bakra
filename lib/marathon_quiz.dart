import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/marathon_data.dart';
import 'package:newproject/quiz_page.dart';
import 'package:audioplayers/audioplayers.dart';

class Marathon_Page extends StatefulWidget {
  int matchnum,roundnum,leftteam,rightteam;
  String leftname,rightname;
  Marathon_Page({required this.matchnum,required this.roundnum,required this.leftteam,required this.rightteam,required this.leftname,required this.rightname});
  @override
  _Marathon_PageState createState() => _Marathon_PageState();
}

class _Marathon_PageState extends State<Marathon_Page> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PLAYING;
  late AudioCache audioCache;

  marathondata object=new marathondata();
  int questionnum=0;
  late Timer timer;
  int time=20;
  bool myanswer=false,eltaly=false;
  String elegaba="الاجابة";
  String leftteam="Draw ",rightteam="Draw ";
  Color leftcolor=Colors.grey;
  Color rightcolor=Colors.grey;
  bool is3nwan=false,isjokerright=false,isjokerleft=false;
  List<String> anawiin=["معلومات عامة","فنون","سفر القضاة","قدرات ذهنية"];
  void is3nwanmethod(){
    if(questionnum%2==0){
      setState(() {
        is3nwan=true;
      });
    }else{
      setState(() {
        is3nwan=false;
      });
    }
  }

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
    //audioPlayer.play("assets/joker.mp3");
    is3nwan=true;
    score();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(time==1){
          timer.cancel();
          elegaba="الوقت انتهى";
          //myanswer=true;
          eltaly=true;
          time=time-1;
        }else{
          time=time-1;
        }
      });
    });
    timer.cancel();
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
        if(event.isKeyPressed(LogicalKeyboardKey.space)){
          if(myanswer==true){
            setState(() {
              if(questionnum>object.questions[widget.matchnum].length-2){
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>new Wasf_Elgawla(matchnum: widget.matchnum, roundnum: widget.roundnum+1,rightteam: widget.rightteam,leftteam: widget.leftteam,rightname: widget.rightname,leftname: widget.leftname,)));
              }else{
                questionnum=questionnum+1;
                elegaba="الاجابة";
                eltaly=false;
                time=20;
                timer = Timer.periodic(Duration(seconds: 1), (timer) {
                  setState(() {
                    if(time==1){
                      timer.cancel();
                      elegaba="الوقت انتهى";
                      //myanswer=true;
                      eltaly=true;
                      time=time-1;
                    }else{
                      time=time-1;
                    }
                  });
                });
                timer.cancel();
                myanswer=false;
                is3nwan=true;
              }
            });
          }
        }
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
        /*appBar: new AppBar(
          //automaticallyImplyLeading: false,
          leading: IconButton(
            icon:Icon(Icons.arrow_back) ,
            onPressed: (){
              AwesomeDialog(
                width: 600,
                context: context,
                title: "Error",
                body: Text("Are you sure you want to exit?",style:TextStyle(fontSize: 25),),
                btnOk: ElevatedButton(
                  onPressed: () { Navigator.pop(context);Navigator.pop(context); timer.cancel();},
                  child: Text("ok"),
                ),
                btnCancel:ElevatedButton(
                  onPressed: () { Navigator.pop(context); },
                  child: Text("cancel"),

                ),
              )..show();
            },
          ),
          title: Text("Title",style: TextStyle(fontSize: 25),),
          centerTitle: true,
        ),*/
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
              is3nwan? Positioned(
                top:100,
                left: width/2-100,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(

                    child: Container(
                      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: Text(anawiin[questionnum],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60,color: Colors.white),textAlign: TextAlign.center,),
                    ),
                    onTap: (){
                      setState(() {
                        is3nwan=false;
                      });

                    },
                  ),
                ),
              ):Positioned(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlue,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 2.0), //(x,y)
                            ),
                          ]
                      ),
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.fromLTRB(400,20,400,20),
                      child: Column(
                        children: [
                          Text(
                            /*widget.quiz.questions[widget.index].question*/object.questions[widget.matchnum][questionnum],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10,),
                          //image?Image.asset("asset/logo.png"):SizedBox()
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          myanswer=true;
                          eltaly=true;
                          timer.cancel();
                        });
                      },
                      child: Container(

                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(elegaba,style: TextStyle(color:Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    myanswer?Container(
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(object.answers[widget.matchnum][questionnum],style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),),
                    ):SizedBox(height: 40,),
                    /*myanswer?InkWell(
                      onTap: (){
                        setState(() {
                          if(questionnum>object.questions[widget.matchnum].length-2){
                            Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>new Wasf_Elgawla(matchnum: widget.matchnum, roundnum: widget.roundnum+1,rightteam: widget.rightteam,leftteam: widget.leftteam,rightname: widget.rightname,leftname: widget.leftname,)));
                          }else{
                            questionnum=questionnum+1;
                            elegaba="الاجابة";
                            eltaly=false;
                            time=20;
                            timer = Timer.periodic(Duration(seconds: 1), (timer) {
                              setState(() {
                                if(time==1){
                                  timer.cancel();
                                  elegaba="الوقت انتهى";
                                  //myanswer=true;
                                  eltaly=true;
                                  time=time-1;
                                }else{
                                  time=time-1;
                                }
                              });
                            });
                            timer.cancel();
                            myanswer=false;
                            is3nwan=true;
                          }
                        });
                      },
                      child: Container(

                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("التالي",style: TextStyle(color:Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                      ),
                    ):SizedBox()*/

                  ],
                ),
              ),
              Positioned(
                right: 100,
                top: 100,
                child: InkWell(
                  onTap: (){
                    if(timer.isActive){
                      timer.cancel();
                    }else{
                      if(myanswer==false){
                        timer = Timer.periodic(Duration(seconds: 1), (timer) {
                          setState(() {
                            if(time==1){
                              timer.cancel();
                              elegaba="الوقت انتهى";
                              //myanswer=true;
                              eltaly=true;
                              time=time-1;
                            }else{
                              time=time-1;
                            }
                          });
                        });
                      }
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(time.toString(),style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold,color: Colors.white),),
                      )
                  ),
                ),
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
              )
            ],

          ),
        ),
      ),
    );
  }
}
