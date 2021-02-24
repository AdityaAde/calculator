import 'package:calculator/ui_view/halamanKedua.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = "", password = "";

  void _tampilkanalert() {
    AlertDialog alertDialog = new AlertDialog(
      title: Text("Peringatan"),
      content: new Container(
        height: 50.0,
        child: new Center(
          child: new Text("Username dan Password salah"),
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  void akunLogin() {
    setState(() {
      if (_formKey.currentState.validate()) {
        print("login berhasil");
        if ((username == "udacoding") && (password == "udacodingjaya2021")) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HalamanKedua()));
        } else {
          _tampilkanalert();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Container(
                child: Image.network(
                    "https://img.freepik.com/free-vector/business-team-discussing-ideas-startup_74855-4380.jpg?size=626&ext=jpg"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 47),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 20),
              Form(
                child: Container(
                  width: 330,
                  height: 300,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              validator: (value1) {
                                if (value1.isEmpty) {
                                  return 'masukan username';
                                }
                                return null;
                              },
                              onChanged: (value1) {
                                username = value1;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder())),
                          SizedBox(height: 20),
                          TextFormField(
                              validator: (value2) {
                                if (value2.length < 6) {
                                  return 'password wajib di isi, tidak boleh kurang dari 6 digit';
                                }
                                return null;
                              },
                              onChanged: (value2) {
                                password = value2;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder())),
                          SizedBox(height: 20),
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                akunLogin();
                              },
                              color: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
