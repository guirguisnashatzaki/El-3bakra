import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/quiz_page.dart';
import 'nashan_data.dart';
import 'package:audioplayers/audioplayers.dart';


class Nashan_Page extends StatefulWidget {
  int matchnum,roundnum,leftteam,rightteam;
  String leftname,rightname;
  Nashan_Page({required this.matchnum,required this.roundnum,required this.leftteam,required this.rightteam,required this.leftname,required this.rightname});
  @override
  _Nashan_PageState createState() => _Nashan_PageState();
}

class _Nashan_PageState extends State<Nashan_Page> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PLAYING;
  late AudioCache audioCache;
  int questionnum=0;
  late Timer timer,timer2;
  int time=20,time2=20;
  String leftteam="Draw ",rightteam="Draw ";
  Color leftcolor=Colors.grey;
  Color rightcolor=Colors.grey;
  Color leftcolorresult=Colors.blue;
  Color rightcolorresult=Colors.blue;
  bool timebutton1=false,timebutton2=false,so2al=true,taly=false,enable1=true,enable2=true,isjokerright=false,isjokerleft=false;
  Nashan_Data object=new Nashan_Data();
  List<MaterialColor> colors=[Colors.grey,Colors.lightGreen,Colors.red];
  List<int> numbersofcolors=[0,0,0,0,0,0,0,0,0];
  List<int> numbersofcolorsleft=[0,0,0,0,0,0,0,0,0];
  List<int> numbersofcolorsright=[0,0,0,0,0,0,0,0,0];
  late String rightvalue,leftvalue;
  TextEditingController controllerleft=new TextEditingController();
  TextEditingController controllerright=new TextEditingController();

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

  void byebye(){
    if(timebutton1==true&&timebutton2==true){
      setState(() {
        taly=true;
      });
    }
  }

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    if(s.isEmpty){
      return false;
    }
    return double.parse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    rightvalue=widget.rightname;
    leftvalue=widget.leftname;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event){
        /*if(event.isKeyPressed(LogicalKeyboardKey.controlLeft)){
          if(so2al){
            setState(() {
              if(questionnum==object.questions[widget.matchnum].length-1){
                numbersofcolors[questionnum]=1;
                //questionnum=questionnum+1;
                if(enable1){
                  //widget.rightteam=widget.rightteam+5;
                  numbersofcolorsright[questionnum]=1;
                  score();
                }else if(enable2){
                  //widget.leftteam=widget.leftteam+5;
                  numbersofcolorsleft[questionnum]=1;
                  score();
                }
                numbersofcolors[questionnum]=1;

                if(enable1){
                  timer.cancel();
                  if(timebutton2==false){
                    enable2=true;
                  }
                  enable1=false;
                  timebutton1=true;
                  so2al=false;
                  byebye();
                }else if(enable2){
                  timer.cancel();
                  if(timebutton1==false){
                    enable1=true;
                  }
                  enable2=false;
                  timebutton2=true;
                  so2al=false;
                  byebye();
                }
                questionnum=0;
                //numbersofcolors=[0,0,0,0,0,0,0,0,0];
              }else{
                numbersofcolors[questionnum]=1;

                if(enable1){
                  //widget.rightteam=widget.rightteam+5;
                  numbersofcolorsright[questionnum]=1;
                  score();
                }else if(enable2){
                  //widget.leftteam=widget.leftteam+5;
                  numbersofcolorsleft[questionnum]=1;
                  score();
                }
                questionnum=questionnum+1;
              }
            });
          }
        }*/
        if(event.isKeyPressed(LogicalKeyboardKey.space)){
         if(so2al==false){
           setState(() {
             so2al=true;
             time=20;
             int test=questionnum+1;
             rightcolorresult=Colors.blue;
             leftcolorresult=Colors.blue;
             controllerright.text="";
             controllerleft.text="";
             if(test==6){
               Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>new Wasf_Elgawla(matchnum: widget.matchnum, roundnum: widget.roundnum+1,rightteam: widget.rightteam,leftteam: widget.leftteam,rightname: widget.rightname,leftname: widget.leftname,)));
             }else{
               questionnum=questionnum+1;
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
        if(event.isKeyPressed(LogicalKeyboardKey.numpadEnter)){
          setState(() {
            so2al=true;
            time=20;
            int test=questionnum+1;
            rightcolorresult=Colors.blue;
            leftcolorresult=Colors.blue;
            controllerright.text="";
            controllerleft.text="";
            if(test==6){
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>new Wasf_Elgawla(matchnum: widget.matchnum, roundnum: widget.roundnum+1,rightteam: widget.rightteam,leftteam: widget.leftteam,rightname: widget.rightname,leftname: widget.leftname,)));
            }else{
              questionnum=questionnum+1;
            }
          });
        }
        if(event.isKeyPressed(LogicalKeyboardKey.enter)){
          if(isNumeric(controllerleft.text)){
            if(isNumeric(controllerright.text)){
              double value1=double.parse(controllerleft.text);
              double value2=double.parse(controllerright.text);
              double answer=double.parse(object.answers[widget.matchnum][questionnum]);
              double result1=(value1-answer).abs();
              double result2 =(value2-answer).abs();
              if(result1>result2){
                setState(() {
                  rightcolorresult=Colors.greenAccent;
                  leftcolorresult=Colors.red;
                  //widget.rightteam=widget.rightteam+5;
                });
              }else if(result2>result1){
                setState(() {
                  rightcolorresult=Colors.red;
                  leftcolorresult=Colors.greenAccent;
                  //widget.leftteam=widget.leftteam+5;
                });
              }else if(result2==result1){
                setState(() {
                  rightcolorresult=Colors.grey;
                  leftcolorresult=Colors.grey;
                });
              }
              else{
                setState(() {
                  rightcolorresult=Colors.blue;
                  leftcolorresult=Colors.blue;
                });
              }
              timer.cancel();
              so2al=false;
            }
          }
        }
      },
      child: Scaffold(
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
              Positioned(
                child: Column(
                  children: [
                   /* Center(

                      child: Row(

                        children: [
                          CustomPaint(
                            painter: TrianglePainter(
                                fillColor: Colors.blue,
                                da5t: 2
                            ),
                            child: Container(
                              height: 70,
                              width: 70,
                            ),
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: colors[numbersofcolors[0]],
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: colors[numbersofcolors[1]],
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color:colors[numbersofcolors[2]],
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: colors[numbersofcolors[3]],
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: colors[numbersofcolors[4]],
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: colors[numbersofcolors[5]],
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: colors[numbersofcolors[6]],
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: colors[numbersofcolors[7]],
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: colors[numbersofcolors[8]],
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          CustomPaint(
                            painter: TrianglePainter(
                                fillColor: Colors.blue,
                                da5t: 0
                            ),
                            child: Container(
                              height: 70,
                              width: 70,
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),*/
                    /*so2al?*/ Container(
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
                    )/*:SizedBox()*/,
                    SizedBox(height: 60,),
                    so2al?SizedBox():Container(
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
                      margin: EdgeInsets.fromLTRB(400,0,400,0),
                      //width: 100,
                      height: 80,
                      child: Text(object.answers[widget.matchnum][questionnum],style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 8,),
                    so2al?InkWell(
                      onTap: (){
                        if(isNumeric(controllerleft.text)){
                          if(isNumeric(controllerright.text)){
                            double value1=double.parse(controllerleft.text);
                            double value2=double.parse(controllerright.text);
                            double answer=double.parse(object.answers[widget.matchnum][questionnum]);
                            double result1=(value1-answer).abs();
                            double result2 =(value2-answer).abs();
                            if(result1>result2){
                              setState(() {
                                rightcolorresult=Colors.greenAccent;
                                leftcolorresult=Colors.red;
                                //widget.rightteam=widget.rightteam+5;
                              });
                            }else if(result2>result1){
                              setState(() {
                                rightcolorresult=Colors.red;
                                leftcolorresult=Colors.greenAccent;
                                //widget.leftteam=widget.leftteam+5;
                              });
                            }else if(result2==result1){
                              setState(() {
                                rightcolorresult=Colors.grey;
                                leftcolorresult=Colors.grey;
                              });
                            }
                            else{
                              setState(() {
                                rightcolorresult=Colors.blue;
                                leftcolorresult=Colors.blue;
                              });
                            }
                            timer.cancel();
                            so2al=false;
                          }
                        }
                      },
                      child: Container(
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
                        margin: EdgeInsets.fromLTRB(400,0,400,0),
                        width: 150,
                        height: 80,
                        child: Text("Solve",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                      ),
                    ):SizedBox()
                    /*InkWell(
                      onTap: (){
                        setState(() {
                          so2al=true;
                          time=20;
                          int test=questionnum+1;
                          rightcolorresult=Colors.blue;
                          leftcolorresult=Colors.blue;
                          controllerright.text="";
                          controllerleft.text="";
                          if(test==6){
                            Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>new Wasf_Elgawla(matchnum: widget.matchnum, roundnum: widget.roundnum+1,rightteam: widget.rightteam,leftteam: widget.leftteam,rightname: widget.rightname,leftname: widget.leftname,)));
                          }else{
                            questionnum=questionnum+1;
                          }
                        });
                      },
                      child: Container(
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
                        margin: EdgeInsets.fromLTRB(400,0,400,0),
                        width: 100,
                        height: 80,
                        child: Text("التالي",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      ),
                    )*/
                    /*so2al?Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: (){
                            setState(() {
                              if(questionnum==object.questions[widget.matchnum].length-1){
                                numbersofcolors[questionnum]=1;
                                //questionnum=questionnum+1;
                                if(enable1){
                                  //widget.rightteam=widget.rightteam+5;
                                  numbersofcolorsright[questionnum]=1;
                                  score();
                                }else if(enable2){
                                  //widget.leftteam=widget.leftteam+5;
                                  numbersofcolorsleft[questionnum]=1;
                                  score();
                                }
                                numbersofcolors[questionnum]=1;

                                if(enable1){
                                  timer.cancel();
                                  if(timebutton2==false){
                                    enable2=true;
                                  }
                                  enable1=false;
                                  timebutton1=true;
                                  so2al=false;
                                  byebye();
                                }else if(enable2){
                                  timer.cancel();
                                  if(timebutton1==false){
                                    enable1=true;
                                  }
                                  enable2=false;
                                  timebutton2=true;
                                  so2al=false;
                                  byebye();
                                }
                                questionnum=0;
                                //numbersofcolors=[0,0,0,0,0,0,0,0,0];
                              }else{
                                numbersofcolors[questionnum]=1;

                                if(enable1){
                                  //widget.rightteam=widget.rightteam+5;
                                  numbersofcolorsright[questionnum]=1;
                                  score();
                                }else if(enable2){
                                  //widget.leftteam=widget.leftteam+5;
                                  numbersofcolorsleft[questionnum]=1;
                                  score();
                                }
                                questionnum=questionnum+1;
                              }
                            });
                          },
                          color: Colors.blue,
                          padding: EdgeInsets.all(15),
                          child: Text("صح",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        MaterialButton(
                          onPressed: (){
                            setState(() {
                              if(questionnum==object.questions[widget.matchnum].length-1){
                                numbersofcolors[questionnum]=2;
                                if(enable1){
                                  //widget.rightteam=widget.rightteam+5;
                                  numbersofcolorsright[questionnum]=2;
                                }else if(enable2){
                                  //widget.leftteam=widget.leftteam+5;
                                  numbersofcolorsleft[questionnum]=2;
                                }
                                if(enable1){
                                  timer.cancel();
                                  if(timebutton2==false){
                                    enable2=true;
                                  }
                                  enable1=false;
                                  timebutton1=true;
                                  so2al=false;
                                  byebye();
                                }else if(enable2){
                                  timer.cancel();
                                  if(timebutton1==false){
                                    enable1=true;
                                  }
                                  enable2=false;
                                  timebutton2=true;
                                  so2al=false;
                                  byebye();
                                }
                                questionnum=0;
                                //numbersofcolors=[0,0,0,0,0,0,0,0,0];
                              }else{
                                if(enable1){
                                  //widget.rightteam=widget.rightteam+5;
                                  numbersofcolorsright[questionnum]=2;
                                }else if(enable2){
                                  //widget.leftteam=widget.leftteam+5;
                                  numbersofcolorsleft[questionnum]=2;
                                }
                                numbersofcolors[questionnum]=2;
                                questionnum=questionnum+1;
                              }
                            });
                          },
                          color: Colors.blue,
                          padding: EdgeInsets.all(15),
                          child: Text("غلط",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),
                        )
                      ],
                    ):SizedBox(),*/
                    /*taly?InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>new Wasf_Elgawla(matchnum: widget.matchnum, roundnum: widget.roundnum+1,rightteam: widget.rightteam,leftteam: widget.leftteam,rightname: widget.rightname,leftname: widget.leftname,)));
                      },
                      child: Container(

                        alignment: Alignment.center,
                        padding: EdgeInsets.all(30),
                        margin: EdgeInsets.fromLTRB(400, 0, 400, 0),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("التالي",style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                      ),
                    ):SizedBox()*/
                    /*InkWell(
                      onTap: (){
                        setState(() {
                          myanswer=true;
                          timer.cancel();
                        });
                      },
                      child: Container(

                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(elegaba,style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    myanswer?Container(
                      padding: EdgeInsets.all(40),
                      child: Text(object.answers[widget.matchnum][questionnum],style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                    ):SizedBox(),
                    */

                  ],
                ),
              ),
              Positioned(
                right: (width/2)-115,
                bottom: 0,
                child: InkWell(
                  onTap: (){
                    if(timer.isActive){
                      timer.cancel();
                    }else{
                      timer = Timer.periodic(Duration(seconds: 1), (timer) {
                        setState(() {
                          if(time==1){
                            timer.cancel();
                            time=time-1;
                          }else{
                            time=time-1;
                          }
                        });
                      });
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
                right: 100,
                top: 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: rightcolorresult,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  width: 150,
                  height: 100,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none
                    ),
                    style: TextStyle(color: Colors.white,fontSize: 30),
                    controller: controllerright,
                    textAlign: TextAlign.center,
                  ),
                ),




                /*InkWell(
                  onTap: (){
                    /*if(enable1){
                      setState(() {
                        so2al=true;
                        enable2=false;
                        time=20;
                        numbersofcolors=[0,0,0,0,0,0,0,0,0];
                      });
                      timer = Timer.periodic(Duration(seconds: 1), (timer) {
                        setState(() {
                          if(time==1){
                            timer.cancel();
                            time=time-1;
                            so2al=false;
                            timebutton1=true;
                            enable2=true;
                            byebye();
                            questionnum=0;
                            //numbersofcolors=[0,0,0,0,0,0,0,0,0];
                          }else{
                            time=time-1;
                          }
                        });
                      });
                    }else{

                    }
*/
                   /* AwesomeDialog(
                      context: context,
                      dialogType: DialogType.INFO_REVERSED,
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      //width: 280,
                      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                      headerAnimationLoop: false,
                      animType: AnimType.BOTTOMSLIDE,
                      body:Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Answer *',
                                ),
                                validator: (String? value) {
                                  return (value != null || value!.contains("0-9")) ? 'Please enter number' : null;
                                },
                                controller: controller,
                              ),
                            ),
                          ),
                          MaterialButton(onPressed: (){

                          },
                          child: Text("ok",style: TextStyle(fontSize: 25),),
                          )
                        ],
                      ),
                      showCloseIcon: true,
                      dismissOnTouchOutside: false,
                      dismissOnBackKeyPress: false,
                      onDissmissCallback: (event){
                        setState(() {
                          rightvalue=controller.text;
                        });
                      }
                    )..show();*/
                  },
                  child: Container(
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(rightvalue,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      )
                  ),
                ),*/
              ),
              Positioned(
                left: 100,
                top: 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: leftcolorresult,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  width: 150,
                  height: 100,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none
                    ),
                    style: TextStyle(color: Colors.white,fontSize: 30),
                    controller: controllerleft,
                    textAlign: TextAlign.center,
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
              ),
              /*Positioned(
                top: 20,
                left: 150,
                child: Material(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(widget.leftname,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      ),
                      onTap: (){
                        setState(() {
                          for(int i=0;i<numbersofcolors.length;i++){
                            numbersofcolors[i]=numbersofcolorsleft[i];
                          }
                        });
                      },
                    )

                ),
              ),
              Positioned(
                  top: 20,
                  right: 150,

                  child:Material(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(widget.rightname,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      ),
                      onTap: (){
                        print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                        setState(() {
                          if(isNumeric(controller.text)){
                            widget.rightname=controller.text;
                          }
                        });
                      },
                    ),
                  )


              )*/
            ],

          ),
        ),
      ),
    );
  }
}
