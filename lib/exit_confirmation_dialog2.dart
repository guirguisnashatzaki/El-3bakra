import 'package:flutter/material.dart';
import 'package:newproject/intro_page.dart';
import 'package:newproject/quiz_page.dart';


class ExitConfirmationDialog2 extends StatefulWidget {

  List<String> teams;

  ExitConfirmationDialog2({required this.teams});

  @override
  _ExitConfirmationDialog2State createState() => _ExitConfirmationDialog2State();
}

class _ExitConfirmationDialog2State extends State<ExitConfirmationDialog2> {
   late String dropdownValue1,dropdownValue2;
   late int value;
   List<int> num=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];


   @override
  void initState() {
    // TODO: implement initState

     dropdownValue1=widget.teams[0];
     dropdownValue2=widget.teams[0];
     value=1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 1300,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child:Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title:  DropdownButton<int>(
              value: value,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 35,
              elevation: 16,
              style: TextStyle(color: Colors.black, fontSize: 50),
              onChanged: (data){
                setState(() {
                  value=data!;
                });
              },
              items: num.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            if(dropdownValue2.compareTo(dropdownValue1)!=0){
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (builder)=> Intro(matchnumber: value-1,roundnumber: 0,rightteam: 0,leftteam: 0, rightname: dropdownValue2,leftname: dropdownValue1,)));
            }
                },
            child: Text("Go"),
            
          ),
          body: Center(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: dropdownValue1,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 35,
                  elevation: 16,
                  style: TextStyle(color: Colors.black, fontSize: 50),
                  onChanged: (data){
                    setState(() {
                      dropdownValue1 = data!;
                    });
                  },
                  items: widget.teams.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text("VS",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic),),
                DropdownButton<String>(
                  value: dropdownValue2,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 35,
                  elevation: 16,
                  style: TextStyle(color: Colors.black, fontSize: 50),
                  onChanged: (data){
                    setState(() {
                      dropdownValue2 = data!;
                    });
                  },
                  items: widget.teams.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            )
          ),
        )

      )
    );
  }
}
