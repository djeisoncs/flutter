import 'package:flutter/material.dart';
import 'package:primeiro_projeto/entity/dog.dart';
import 'package:primeiro_projeto/pages/dog_page.dart';
import 'package:primeiro_projeto/util/nav.dart';

class HelloView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloView> {
  bool _gridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello View"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
              icon: Icon(Icons.grid_on),
              onPressed: () {
                setState(() {
                  _gridView = true;
                });
              }),
        ],
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png")
    ];

    if (_gridView) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];

    return GestureDetector(
      onTap: () {
        navigate(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _image(dog.foto),
          _text(dog.nome),
        ],
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

  _text(String nome) {
    return Container(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          nome,
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
    );
  }
}
