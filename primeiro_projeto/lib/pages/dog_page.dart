
import 'package:flutter/material.dart';
import 'package:primeiro_projeto/entity/dog.dart';

class DogPage extends StatelessWidget {

final Dog dog;

  const DogPage(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
title: Text(dog.nome),
centerTitle: true,
),
      body: Image.asset(dog.foto),
    );
  }

}