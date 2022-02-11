import 'package:flutter/material.dart';
import 'quizzler_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Quizzler !!',
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //เริ่มต้นกำหนดค่าสำหรับ textField
  final myController = TextEditingController();
  bool _validate = false;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  //โดยถ้าต้องการอ้างถึงค่าข้อมูลใน textField นี้ สามารถอ้างถึงด้วย myController.text
  //จบการกำหนดค่าต่างๆสำหรับ textField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 50,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Hello,\nWhat\'s your name?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                  errorText: _validate ? 'Your username must include at least one alphabet' : null,
                ),
              ),
            ),
          ),
          //เริ่มต้นตัวอย่างการใช้งาน
          GestureDetector(
            onTap: () {
              if (!myController.text.contains(RegExp('[a-zA-Z]'))) {
                setState(() {
                  _validate = true;
                });
              } else {
                setState(() {
                  _validate = false;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Quizzler(name: myController.text)));
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blueGrey,
                    height: 50.0,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
