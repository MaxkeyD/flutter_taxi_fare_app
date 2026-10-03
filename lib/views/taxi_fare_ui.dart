// ignore_for_file: unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';

class TaxiFareUi extends StatefulWidget {
  const TaxiFareUi({super.key});

  @override
  State<TaxiFareUi> createState() => _TaxiFareUiState();
}

class _TaxiFareUiState extends State<TaxiFareUi> {
  // ตัวควบคุม TextField
  TextEditingController distanceCtrl = TextEditingController();
  TextEditingController timelateCtrl = TextEditingController();
  //ตัวแปรเก็บค่าโดยสาร
  double fare = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ส่วนของ Appbar
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text(
          'Taxi Fare',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            bottom: 50,
            left: 50,
            right: 50,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/car.png',
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'คำนวณค่าโดยสารแท็กซี่',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'ระยะทาง (กิโลเมตร)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '🛣️',
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              TextField(
                controller: distanceCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'กรุณากรอกระยะทาง',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    color: Colors.grey[700],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'เวลารถติด (นาที)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '⏰',
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: timelateCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'กรุณากรอกเวลารถติด',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    color: Colors.grey[700],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate UI ว่าป้อนครบไหม หากไม่ครบแสดง MSG เตือน
                  // ตรวจสอบป้อนน้ำหนัก
                  if (distanceCtrl.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('กรุณาป้อนข้อมูลให้ครบถ้วน'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  // ตรวจสอบป้อนส่วนสูง
                  if (timelateCtrl.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('กรุณาป้อนข้อมูลให้ครบถ้วน'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  // หลังจาก Validate คำนวณ bmi และแสดงผล
                  double distance = double.parse(distanceCtrl.text);
                  double timelate = double.parse(timelateCtrl.text);

                  //คำนวฯ bmi ตามสูตร และเอาค่าที่คำนวฯได้ไปแสดงผล พร้อมกับแสดงการแปลผลของ bmi
                  // ***โคดการทำงานใดๆ ก็ตามที่มีผลต่อการแสดงผลบนหน้าจอ ต้องเขียนอยู่ใต้ setState
                  setState(() {
                     fare = 35;
                    // 2-10 กม.
                    if (distance > 1) {
                      fare += (distance - 1) * 6.5;
                    }
                    // 10-20 กม.
                    if (distance > 10) {
                      fare += (distance - 10) * 0.5;
                    }
                    // 20-40 กม.
                    if (distance > 20) {
                      fare += (distance - 20) * 1;
                    }
                    // 40-60 กม.
                    if (distance > 40) {
                      fare += (distance - 40) * 0.5;
                    }
                    // 60-80 กม.
                    if (distance > 60) {
                      fare += (distance - 60) * 0.5;
                    }
                    // เกิน 80 กม.
                    if (distance > 80) {
                      fare += (distance - 80) * 1.5;
                    }
                    // รถติด
                    fare += timelate * 3;
                  });
                },
                child: Text(
                  'คำนวณค่าโดยสาร',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              ElevatedButton(
                onPressed: () {
                  // เคลียร์ช่อง TextField แล้วก็ค่า BMI เป็น 0.00
                  setState(() {
                    distanceCtrl.text = '';
                    timelateCtrl.text = '';
                    fare = 0.00;
                  });
                },
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  
                  backgroundColor: Colors.grey[500],
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              // แสดงผล ค่า ค่าโดยสาร
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.190,
                child: Container(
                  color: Colors.yellow[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ค่าโดยสาร Taxi',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        fare.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'บาท',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
