import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ExitConfirmationDialog extends StatefulWidget {
  late String question,answer;
  late int questionnum;
  ExitConfirmationDialog({
    required this.answer,required this.question,required this.questionnum
  });
  @override
  _ExitConfirmationDialogState createState() => _ExitConfirmationDialogState();
}

class _ExitConfirmationDialogState extends State<ExitConfirmationDialog> {
  int time=20;
  late Timer timer;
  bool myanswer=false,eltaly=false;
  String elegaba="الاجابة";
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(time==1){
          timer.cancel();
          elegaba="الوقت انتهى";
          //myanswer=true;
          //eltaly=true;
          time=time-1;
        }else{
          time=time-1;
        }
      });
    });
    timer.cancel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.space)){
          setState(() {
            elegaba=widget.answer;
          });
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Column(
            children: <Widget>[
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
                margin: EdgeInsets.fromLTRB(400,20,400,10),
                child: Column(
                  children: [
                    Text(
                      /*widget.quiz.questions[widget.index].question*/widget.question,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    //image?Image.asset("asset/logo.png"):SizedBox()
                  ],
                ),
              ),
              InkWell(
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
              SizedBox(height: 5,),
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
                  child: Text(elegaba,style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                ),
              ),
              /*myanswer?Container(
                padding: EdgeInsets.all(30),
                child: Text(widget.answer,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
              ):SizedBox(height: 40,),*/
              /*myanswer?InkWell(
                onTap: (){
                  setState(() {
                    if(questionnum>object.questions[widget.matchnum].length-2){
                      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=>new Wasf_Elgawla(matchnum: widget.matchnum, roundnum: widget.roundnum+1,rightteam: widget.rightteam,leftteam: widget.leftteam,)));
                    }else{
                      questionnum=questionnum+1;
                      elegaba="الاجابة";
                      time=5;
                      eltaly=false;
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
                      myanswer=false;
                    }
                  });
                },
                child: Container(

                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text("التالي",style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                ),
              ):SizedBox()*/
            ],
          ),
        ),
      ),
    );
  }
}
