import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/mapping_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool> _mockcheckforsession() async{
    await Future.delayed(Duration(milliseconds: 3000),() {});
    return true;
  }

  void _navigatetologin(){
    Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Mapping_Page2()));
  }

  @override
  void initState() {
    super.initState();
    _mockcheckforsession().then((value) => _navigatetologin());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/salib.png",width: 300,height: 300,),
            Image.asset("assets/knissa.png",width: 300,height: 300,),
            Container(width: 1,height: 1,child: Text("ننسي"),)
          ],
        ),
      ),
    );
  }
}
