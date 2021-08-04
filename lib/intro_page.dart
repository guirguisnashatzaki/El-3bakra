import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/services.dart';
import 'package:newproject/quiz_page.dart';
import 'package:newproject/sor3a_data.dart';
import 'package:newproject/teddy_controller.dart';
import 'package:rive/rive.dart';

class Intro extends StatefulWidget {
  late int matchnumber,roundnumber,rightteam,leftteam;
  late String rightname,leftname;
  Intro({
    required this.rightteam,required this.leftname,required this.matchnumber,required this.rightname,required this.leftteam,required this.roundnumber
  });
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

 // String animationtype="idle";
  TeddyController controller=new TeddyController();
  double op=0;
  bool so2al=false;
  Sor3a_Data object=new Sor3a_Data();
  late String answer;
  //5.5
  @override
  Widget build(BuildContext context) {

    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.space)){
          setState(() {
            op=1;
          });
          controller.ishta5al("success");
        }
        if(event.isKeyPressed(LogicalKeyboardKey.shiftLeft)){
          controller.ishta5al("fail");
        }
        if(event.isKeyPressed(LogicalKeyboardKey.arrowUp)){
          controller.ishta5al("hands_up");
        }
        if(event.isKeyPressed(LogicalKeyboardKey.arrowDown)){
          controller.ishta5al("hands_down");
        }
        if(event.isKeyPressed(LogicalKeyboardKey.enter)){
          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (builder)=> Wasf_Elgawla(matchnum: widget.matchnumber,roundnum: widget.roundnumber,rightteam: widget.rightteam,leftteam: widget.leftteam, rightname: widget.rightname,leftname: widget.leftname)));
        }
        if(event.isKeyPressed(LogicalKeyboardKey.numpadEnter)){

          setState(() {
            answer=object.answers[widget.matchnumber];
          });

        }
        if(event.isKeyPressed(LogicalKeyboardKey.controlRight)){
          setState(() {
            so2al=true;
            answer=object.questions[widget.matchnumber];
          });
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(38, 50, 56, 1),

        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: 400,
                height: 300,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: FlareActor(
                        "Teddy.flr",
                        //alignment: Alignment.center,
                        fit: BoxFit.fill,
                        animation: "idle",
                        controller: controller,
                      ),
                  ),
                ),
                  /*RiveAnimation.asset("assets/teddybear.riv"),*/

              ),
              SizedBox(height: 20,),
              so2al?Container(
                  alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.fromLTRB(400, 0, 400, 0),
                padding: EdgeInsets.all(10),
                child: Text(answer,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                ):Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                      opacity: op,
                      duration: Duration(milliseconds: 4000),
                      child: Text(" العباقرة",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic),),
                  ),
                  AnimatedOpacity(
                    opacity: op,
                    duration: Duration(milliseconds: 3000),
                    child: Text("في ",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white,),),
                  ),
                  AnimatedOpacity(
                    opacity: op,
                    duration: Duration(milliseconds: 2000),
                    child: Text("بكم ",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white,),),
                  ),
                  AnimatedOpacity(
                    opacity: op,
                    duration: Duration(milliseconds: 1000),
                    child: Text("مرحبا ",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white,),),
                  ),

                ],
              ),

              SizedBox(height: 30,),
              /*MaterialButton(
                  onPressed: (){
                    setState(() {
                      so2al=true;
                    });
                  },
                  child: Text("سؤال السرعة",style: TextStyle(fontSize: 25,color: Colors.white,),),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
