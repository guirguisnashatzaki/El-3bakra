import 'package:flutter/material.dart';
import 'package:newproject/Luck_wheel_data.dart';
import 'dialog_helper.dart';
import 'widgets/fortune_wheel.dart';
class DemoScreen extends StatefulWidget {
  int matchnum,roundnum,leftteam,rightteam;
  DemoScreen({required this.roundnum,required this.rightteam,required this.leftteam,required this.matchnum});

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  FortuneWheelController<int> fortuneWheelController = FortuneWheelController();
  FortuneWheelChild? currentWheelChild;
  String currentBalance="";
  bool deeny=false,ma3loomat=false,eloom=false,tari5=false,go5rafia=false;
  Text dialogtext=new Text("الاجابة");
  late DialogHelper object2;
  static Map<String, int> mapofint=
    {
      "علوم":0,
      "سفر القضاة":0,
      "قدرات ذهنية":0,
      "جغرافيا":0,
      "رياضة":0,
    };
  @override
  void initState() {
    mapofint={
      "علوم":0,
      "سفر القضاة":0,
      "قدرات ذهنية":0,
      "جغرافيا":0,
      "رياضة":0,
    };
    fortuneWheelController.addListener(() {
      if (fortuneWheelController.value == null)
        return;

      setState(() {
        currentWheelChild = fortuneWheelController.value;
      });

      if (fortuneWheelController.isAnimating)
        return;

      if (fortuneWheelController.shouldStartAnimation)
        return;

      setState(() {
        currentBalance = fortuneWheelController.value!.value;
        isdeeny();
        iskodrat();
        isriada();
        is3loom();
        isgo5rafia();
      });
    });
    super.initState();
  }

  void isdeeny(){
    if(currentBalance.compareTo("سفر القضاة")==0){
      setState(() {
        deeny=true;
      });
    }
  }
  void isriada(){
    if(currentBalance.compareTo("رياضة")==0){
      setState(() {
        tari5=true;
      });
    }
  }
  void is3loom(){
    if(currentBalance.compareTo("علوم")==0){
      setState(() {
        eloom=true;
      });
    }
  }
  void isgo5rafia(){
    if(currentBalance.compareTo("جغرافيا")==0){
      setState(() {
        go5rafia=true;
      });
    }
  }
  void iskodrat(){
    if(currentBalance.compareTo("قدرات ذهنية")==0){
      setState(() {
        ma3loomat =true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage("assets/background.jpeg"),
                  fit: BoxFit.cover)
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: (){
                    Luck_Wheel_Data object=new Luck_Wheel_Data();
                    String question=object.questions[widget.matchnum][currentBalance]![mapofint[currentBalance]!],answer=object.answers[widget.matchnum][currentBalance]![mapofint[currentBalance]!];
                    object2=new DialogHelper(answer: answer, question: question,questionnum: mapofint[currentBalance]!) ;
                    setState(() {
                      mapofint[currentBalance]=mapofint[currentBalance]!+1;
                    });
                    object2.exit(context);
                    /*if(currentBalance.isEmpty){

                    }else{
                      Luck_Wheel_Data object=new Luck_Wheel_Data();
                      int time=20;
                      String question=object.questions[widget.matchnum][currentBalance]!,answer=object.answers[widget.matchnum][currentBalance]!;
                      final Future<Timer> _calculation = Future<Timer>.delayed(
                        const Duration(seconds: 0),
                            () => Timer.periodic(Duration(seconds: 1), (timer) {
                              setState(() {
                              time=time-1;
                              });
                            }
                          )
                      );

                      AwesomeDialog(
                          width: 600,
                          context: context,
                          title: "question",
                          body:Column(
                            children: [
                              Text(question,style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                              SizedBox(height: 50,),
                              FutureBuilder<Timer>(future: _calculation, builder: (BuildContext context,AsyncSnapshot<Timer> snapshot){
                                return Container(
                                    padding: EdgeInsets.all(50),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                    child:Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(time.toString(),style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold,color: Colors.white),),
                                    )
                                );
                              })
                              ,
                              SizedBox(height: 20,)
                            ],
                          ),
                          btnOk: new ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(EdgeInsets.all(20))
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                                AwesomeDialog(
                                  context: context,
                                  width: 600,
                                  title: "success",
                                  body: Text(answer,style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                                )..show();
                              }, child: dialogtext)
                      )..show();
                    }*/
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: /*currentBalance.isNegative ? Colors.red : Colors.green*/Colors.green,
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text(
                      currentBalance,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 50
                      ),
                    ),
                  ),
                ),
                SizedBox(),
                Divider(color: Colors.black87,),

                Container(
                  alignment: Alignment.center,
                  //height: 80,
                  //width: 80,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*deeny ? currentWheelChild!.foreground : */Mychoice(text: "سفر القضاة",matchnum: widget.matchnum,),
                      /*ma3loomat ? currentWheelChild!.foreground : */Mychoice(text: "قدرات ذهنية",matchnum: widget.matchnum),
                      /*tari5 ? currentWheelChild!.foreground : */Mychoice(text: "رياضة",matchnum: widget.matchnum,),
                      /*eloom ? currentWheelChild!.foreground : */Mychoice(text: "علوم",matchnum: widget.matchnum,),
                      /*go5rafia ? currentWheelChild!.foreground : */Mychoice(text: "جغرافيا",matchnum: widget.matchnum,),
                    ],
                  )

                ),
                SizedBox(height: 16,),
                SizedBox(
                    width: 350,
                    height: 350,
                    child: FortuneWheel<int>(
                      controller: fortuneWheelController,
                      children: [
                        _createFortuneWheelChild("قدرات ذهنية",Colors.orange),
                        _createFortuneWheelChild("رياضة",Colors.orange),
                        _createFortuneWheelChild("علوم",Colors.orange),
                        _createFortuneWheelChild("جغرافيا",Colors.orange),
                        _createFortuneWheelChild("سفر القضاة",Colors.orange),
                        _createFortuneWheelChild("انا اختار",Colors.orange),
                        _createFortuneWheelChild("اختارولي",Colors.orange),

                      ],
                    )
                ),
                SizedBox(height: 24),
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        deeny=false;
                        tari5=false;
                        go5rafia=false;
                        ma3loomat=false;
                        eloom=false;
                      });
                      fortuneWheelController.rotateTheWheel();
                    } ,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('ROTATE', style: TextStyle(fontWeight: FontWeight.bold),),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  FortuneWheelChild<int> _createFortuneWheelChild(String value,Color mycolor) {
    Color color = /*value.isNegative ? Colors.red : Colors.green*/mycolor;
    //String verb = value.isNegative ? 'Lose' : 'Win';
    //String valueString = value;

    return FortuneWheelChild(
        foreground: _getWheelContentCircle(color, value),
        value: value
    );
  }

  Container _getWheelContentCircle(Color backgroundColor, String text) {
    return Container(
      width: 72,
      height: 72,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white.withOpacity(0.8),
              width: 4
          )
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Mychoice extends StatelessWidget {
  int matchnum;
  String text;
  Mychoice({
    required this.text,required this.matchnum
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Luck_Wheel_Data object=new Luck_Wheel_Data();

        String question=object.questions[matchnum][text]![_DemoScreenState.mapofint[text]!],answer=object.answers[matchnum][text]![_DemoScreenState.mapofint[text]!];

        DialogHelper object2=new DialogHelper(answer: answer, question: question, questionnum: _DemoScreenState.mapofint[text]!);
        _DemoScreenState.mapofint[text]=_DemoScreenState.mapofint[text]!+1;
        object2.exit(context);
        /*AwesomeDialog(
            width: 600,
            context: context,
            title: "question",
            body: Text(question,style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
            btnOk: new ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(20))
                ),
                onPressed: (){
                  Navigator.pop(context);
                  AwesomeDialog(
                    context: context,
                    width: 600,
                    title: "success",
                    body: Text(answer,style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                  )..show();
                }, child: Text("الاجابة"))
        )..show();*/
      },
      child: Container(
        width: 150,
        height: 72,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.rectangle,
            border: Border.all(
                color: Colors.white.withOpacity(0.8),
                width: 4
            )
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.none,
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}