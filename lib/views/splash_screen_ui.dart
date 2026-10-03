// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_taxi_fare_app/views/taxi_fare_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // โค้ดคำสั่งหน่วงเวลา เมื่อครบจะเปิดไปหน้าจอ Home
    //เปิดไปแบบย้อนกลับไม่ได้
    Future.delayed(
        // เวลาที่จะหน่วง
        Duration(seconds: 3),

        // เมื่อครบเวลาแล้วจะให้ทำไร
        () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TaxiFareUi(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/car.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Taxi Fare Calculator',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
               'คำนวณค่าโดยสารแท็กซี่',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              child: CircularProgressIndicator(
                color: Colors.yellow,
                strokeWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
