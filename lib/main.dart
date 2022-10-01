import 'package:flutter/material.dart';
import "dart:async";
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DateApp(),
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({super.key});

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
///////////////////////////////////////////////////dart

  String day = ""; //
  String date = "" ; //mounth ,${DateTime.now().day.toString()}, ${DateTime.now().year.toString()}
  String time =
      ""; //{hour.toString().padLeft(2, '0')} :${minute.padLeft(2, '0')} :${second.padLeft(2, '0')}

// to changeTimeEverySecond
  changeTimeEverySecond() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
         day  =DateFormat("EEEE").format(DateTime.now());  // .EEEE() =="EEEE" --  && "EEE" IS brief
         date =DateFormat("MMM d , y").format(DateTime.now());
         time =DateFormat("hh : mm : ss a").format(DateTime.now());     
      });
    });
  }

  String text = "";
// function بعد مُده مُعينة مره واحده مره واحده فإننا نستخدم هذا الكود
  calledOnlyOnTimeAfter7Sexond() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        text = "❤❤❤";
      });
    });
  }

  // تنفذ الاكواد التي بداخلها عند تشغيل البرنامج لاول مره
  //called once when your app. is starting for the first time
  // invoke fun when run automatically
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeTimeEverySecond();
    calledOnlyOnTimeAfter7Sexond();
  }

///////////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      appBar: AppBar(
        title: Text(
          "Time & Date App",
          style: TextStyle(
            fontSize: 27,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 57, 73, 80),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $day", //////////
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "$date", /////////
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "$time", ///// change every second
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "$text",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
