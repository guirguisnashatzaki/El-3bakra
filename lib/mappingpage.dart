import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/quiz_page.dart';


class Mapping_Page extends StatefulWidget {
  @override
  _Mapping_PageState createState() => _Mapping_PageState();
}

class _Mapping_PageState extends State<Mapping_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ListView(
        children: [
          Container(width:1,height: 1,child: Text('ب',style:TextStyle(fontSize: 1) ,)),
          Image.asset("assets/salib.png",width: 300,height: 300,),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Buttony(text: "مارجرجس vs مارمينا",index: 0,),
                Buttony(text: " 2 ",index: 1,),
                Buttony(text: " 3 ",index: 2,),
                Buttony(text: " 4 ",index: 3,),
                Buttony(text: " 5 ",index: 4,),
                Buttony(text: " 6 ",index: 5,),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Buttony(text: " 2 ",index: 6,),
                Buttony(text: " 7 ",index: 7,),
                Buttony(text: " 8 ",index: 8,),
                Buttony(text: " 9 ",index: 9,),
                Buttony(text: "10",index: 10,),
                Buttony(text: "11",index: 11,),


              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Buttony(text: " 2 ",index: 12,),
                Buttony(text: "13",index: 13,),
                Buttony(text: "14",index: 14,),
                Buttony(text: "15",index: 15,),
                Buttony(text: "16",index: 16,),
                Buttony(text: "17",index: 17,),


              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Buttony(text: " 2 ",index: 18,),
                Buttony(text: "19",index: 19,),
                Buttony(text: "20",index: 20,),
                Buttony(text: "21",index: 21,),
                Buttony(text: "22",index: 22,),
                Buttony(text: "23",index: 23,),

              ],
            ),
          )
        ],
      ),
    );
  }
}

class Buttony extends StatelessWidget {
  String text="";
  int index;
  Buttony({required this.text,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      alignment: Alignment.center,
      child:ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(30)),
        ),
        onPressed: (){
          //Navigator.push(context, new MaterialPageRoute(builder: (builder)=> Wasf_Elgawla(matchnum: index,roundnum: 0,rightteam: 0,leftteam: 0,)));
        },
        child: Text(this.text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textDirection: TextDirection.rtl,),
      )
    );
  }
}


