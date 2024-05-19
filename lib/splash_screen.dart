import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finalexam/applocale/applocale.dart';
import 'home_page.dart';

class Localization extends StatelessWidget {
  const Localization({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      home: MyHomePage(),
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale("en", "EN"),
        Locale("ar", "AR"),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }
  startSplashScreenTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, navigationToNextPage);
  }
  void navigationToNextPage() async {
    Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/images/exam.png',
                height: 200,
                width: 200,
              ),
              Text(
                "${getLang(context, "MyName")}",
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              const CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
              Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 50),
                  child: Text(
                    "${getLang(context, "Waiting!!!")}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25
                    ),
                  )
              )
            ]
        ),
      ),
    );
  }
}