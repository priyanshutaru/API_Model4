// ignore_for_file: prefer_const_constructors

import 'package:api9/Api%20Services/api_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UserTodo> userkaam = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api 9"),
      ),
      body: FutureBuilder(
          future: kaam(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: userkaam.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      // width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Id : ${userkaam[index].id}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Title : ${userkaam[index].title}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Status : ${userkaam[index].completed}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<UserTodo>> kaam() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userkaam.add(UserTodo.fromJson(index));
      }
      return userkaam;
    } else {
      return userkaam;
    }
  }
}
