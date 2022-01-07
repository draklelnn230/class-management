import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MaterialApp> {
  TextEditingController masv = TextEditingController();
  TextEditingController tensv = TextEditingController();
  TextEditingController ngaysinh = TextEditingController();
  TextEditingController gioitinh = TextEditingController();
  TextEditingController quequan = TextEditingController();

  final firebase = FirebaseFirestore.instance;
  create() async {
    try {
      await firebase.collection("Student").doc().set({
        "masv": masv.text,
        "tensv": tensv.text,
        "gioitinh": gioitinh.text,
        "ngaysinh": ngaysinh.text,
        "quequan": quequan.text
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      firebase
          .collection("Student")
          .doc(tensv.text)
          .update({"tensv": tensv.text});
      firebase
          .collection("Student")
          .doc(gioitinh.text)
          .update({"gioitinh": gioitinh.text});
      firebase
          .collection("Student")
          .doc(gioitinh.text)
          .update({"ngaysinh": ngaysinh.text});
      firebase
          .collection("Student")
          .doc(gioitinh.text)
          .update({"quequan": quequan.text});
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {} catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Class Management"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            TextField(
                controller: masv,
                decoration: InputDecoration(
                    labelText: "Mã sinh viên",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 15,
            ),
            TextField(
                controller: tensv,
                decoration: InputDecoration(
                    labelText: "Họ tên",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 15,
            ),
            TextField(
                controller: gioitinh,
                decoration: InputDecoration(
                    labelText: "Giới tính",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 15,
            ),
            TextField(
                controller: ngaysinh,
                decoration: InputDecoration(
                    labelText: "Ngày sinh",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 15,
            ),
            TextField(
                controller: quequan,
                decoration: InputDecoration(
                    labelText: "Quê quán",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      create();
                      masv.clear();
                      tensv.clear();
                      ngaysinh.clear();
                      gioitinh.clear();
                      quequan.clear();
                    },
                    child: Text("Create")),
                ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      update();
                      masv.clear();
                      tensv.clear();
                      ngaysinh.clear();
                      gioitinh.clear();
                      quequan.clear();
                    },
                    child: Text("Update")),
                ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      delete();
                      masv.clear();
                      tensv.clear();
                      ngaysinh.clear();
                      gioitinh.clear();
                      quequan.clear();
                    },
                    child: Text("Delete"))
              ],
            )
          ]),
        ));
  }
}
