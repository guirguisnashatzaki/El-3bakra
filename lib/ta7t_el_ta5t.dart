import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/painters/triangle_painter.dart';
import 'package:newproject/quiz_page.dart';
import 'package:newproject/ta7t_el_da5t_data.dart';


class Ta7t_El_Da5t_Page extends StatefulWidget {
  int matchnum,roundnum,leftteam,rightteam;
  String leftname,rightname;
  Ta7t_El_Da5t_Page({required this.matchnum,required this.roundnum,required this.leftteam,required this.rightteam,required this.leftname,required this.rightname});
  @override
  _Ta7t_El_Da5t_PageState createState() => _Ta7t_El_Da5t_PageState();
}

class _Ta7t_El_Da5t_PageState extends State<Ta7t_El_Da5t_Page> {
  int questionnum=0;
  late Timer timer,timer2;
  int time=45,time2=45;
  String leftteam="Draw ",rightteam="Draw ";
  Color leftcolor=Colors.grey;
  Color rightcolor=Colors.grey;
  bool timebutton1=false,timebutton2=false,so2al=false,taly=false,enable1=true,enable2=true;
  Ta7t_El_Da5t_Data object=new Ta7t_El_Da5t_Data();
  List<MaterialColor> colors=[Colors.grey,Colors.lightGreen,Colors.red];
  List<int> numbersofcolors=[0,0,0,0,0,0,0,0,0];
  List<int> numbersofcolorsleft=[0,0,0,0,0,0,0,0,0];
  List<int> numbersofcolorsright=[0,0,0,0,0,0,0,0,0];

  @override
  void initState() {
    score();
    /*timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
    });*/
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.controlLeft)){
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
        }
        if(event.isKeyPressed(LogicalKeyboardKey.enter)){
          if(so2al){
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
                    Center(
                      
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
                    ),
                  so2al? Container(
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
                    ):SizedBox(),
                    SizedBox(height: 110,),
                       so2al?Row(
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
                          child: Text("صح",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
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
                          child: Text("غلط",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold)),
                        )
                      ],
                    ):SizedBox(),
                    taly?InkWell(
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
                    ):SizedBox()
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
                right: (width/2)-100,
                bottom: 50,
                child: InkWell(
                  onTap: (){

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
                child: InkWell(
                  onTap: (){
                    if(enable1){
                      setState(() {
                        so2al=true;
                        enable2=false;
                        time=45;
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

                    },
                  child: Container(
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(widget.rightname,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      )
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: 100,
                child: InkWell(
                  onTap: (){
                    if(enable2){
                      setState(() {
                        so2al=true;
                        enable1=false;
                        time=45;
                        numbersofcolors=[0,0,0,0,0,0,0,0,0];
                      });
                      timer = Timer.periodic(Duration(seconds: 1), (timer) {
                        setState(() {
                          if(time==1){
                            timer.cancel();
                            time=time-1;
                            so2al=false;
                            timebutton2=true;
                            enable1=true;
                            byebye();
                            questionnum=0;

                          }else{
                            time=time-1;
                          }
                        });
                      });
                    }else{

                    }

                  },
                  child: Container(
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(widget.leftname,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
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
                      setState(() {
                        for(int i=0;i<numbersofcolors.length;i++){
                          numbersofcolors[i]=numbersofcolorsright[i];
                        }
                      });
                    },
                  ),
                )


              )
            ],

          ),
        ),
      ),
    );
  }
}
