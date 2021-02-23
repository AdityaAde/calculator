import 'package:flutter/material.dart';
import 'package:tabbar/tabbar.dart';

class HalamanKedua extends StatefulWidget {
  @override
  _HalamanKeduaState createState() => _HalamanKeduaState();
}

class _HalamanKeduaState extends State<HalamanKedua> {
  final controller = PageController();
  final _formKey = GlobalKey<FormState>();

  var lebar = 0, panjang = 0, tinggi = 0, hasil1 = 0, hasil2 = 0;

  void hasilLuas() {
    setState(() {
      if (_formKey.currentState.validate()) {
        hasil1 = panjang * lebar;
      }
    });
  }

  void hasiVolume() {
    setState(() {
      if (_formKey.currentState.validate()) {
        hasil2 = panjang * lebar * tinggi;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Calculator"),
          centerTitle: true,
          bottom: PreferredSize(
              child: TabbarHeader(
                controller: controller,
                tabs: [
                  Tab(child: Icon(Icons.apps)),
                  Tab(text: "Konversi"),
                ],
              ),
              preferredSize: Size.fromHeight(kToolbarHeight)),
        ),
        body: TabbarContent(
          controller: controller,
          children: <Widget>[
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Luas",
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Masukan panjang';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            panjang = int.parse(value);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Panjang (P)'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value1) {
                              if (value1.isEmpty) {
                                return 'masukan lebar';
                              }
                              return null;
                            },
                            onChanged: (value1) {
                              lebar = int.parse(value1);
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Lebar (L)')),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                                child: Text(
                                  'Hitung',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.blue,
                                onPressed: () {
                                  hasilLuas();
                                }),
                            Text(
                              hasil1.toString(),
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 30.0),
                            )
                          ],
                        ),
                        SizedBox(height: 40),
                        Text("Volume", style: TextStyle(fontSize: 30)),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value2) {
                            if (value2.isEmpty) {
                              return 'masukan angka';
                            }
                            return null;
                          },
                          onChanged: (value3) {
                            tinggi = int.parse(value3);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tinggi (t)'),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                                child: Text(
                                  'Hitung',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.blue,
                                onPressed: () {
                                  hasiVolume();
                                }),
                            Text(
                              hasil2.toString(),
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 30),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(color: Colors.red),
          ],
        ));
  }
}
