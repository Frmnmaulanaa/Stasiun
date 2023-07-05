import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pahlawan_nasional/repository.dart';

import './model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> listModel = [];

  Repository repository = Repository();
  getData() async {
    listModel = await repository.getData();
  }

  // get data
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stasiun'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.code,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    listModel[index].code,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            );
          },
          itemCount: listModel.length,
        ));
  }
}
