import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:primeiro_projeto/components/buttons/blue_button.dart';
import 'package:primeiro_projeto/pages/hello_view.dart';
import 'package:primeiro_projeto/pages/page_01.dart';
import 'package:primeiro_projeto/pages/page_02.dart';
import 'package:primeiro_projeto/util/nav.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Primeiro App"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Tab 1",
              ),
              Tab(
                text: "Tab 2",
              ),
              Tab(
                text: "Tab 3",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _bodyTab1(context),
            _bodyTab2(),
            _bodyTab3(),
          ],
        ),
      ),
    );
  }

  _image(String urlCaminho) {
    return Container(
      child: Image.asset(
        urlCaminho,
        fit: BoxFit.cover,
      ),
    );
  }

  _bodyTab1(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _imagens(),
          _buttons(),
        ],
      ),
    );
  }

  _bodyTab2() {
    return Container(
      color: Colors.indigo,
    );
  }

  _bodyTab3() {
    return Container(
      color: Colors.red,
    );
  }

  _text() {
    return Text(
      "Tab Principal",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
    );
  }

  _imagens() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _image("assets/images/dog1.png"),
          _image("assets/images/dog2.png"),
          _image("assets/images/dog3.png"),
          _image("assets/images/dog4.png"),
          _image("assets/images/dog5.png")
        ],
      ),
    );
  }

  _buttons() {
    return Builder(builder: (BuildContext context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("Hello View",
                  onPressed: () => _onClickNavigator(context, HelloView())),
              BlueButton("Page 1",
                  onPressed: () => _onClickNavigator(context, Page01())),
              BlueButton("Page 2",
                  onPressed: () => _onClickNavigator(context, Page02())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("Snack", onPressed: () => _onClickSnack(context)),
              BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
              BlueButton("Toast", onPressed: _onClickToast),
            ],
          ),
        ],
      );
    });
  }

  void _onClickToast() async {
    Fluttertoast.showToast(
        msg: "Teste Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String retorno = await navigate(context, page);
    print("Retorno >>> $retorno");
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Teste Snack Bar"),
      action: SnackBarAction(
        label: "Ok",
        onPressed: () => print("Clicou no Ok"),
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Teste Dialog"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar"),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Ok"),
                ),
              ],
            ),
          );
        });
  }
}
