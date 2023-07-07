import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {


  late Future<List<User>> _future;

  @override
  void initState() {
    super.initState();
    _future = fetchUsers();
  }


  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse(apiUrl));
    return (json.decode(response.body)['entries'] as List).map((e) =>
        User.fromJson(e)).toList();
  }
  final String apiUrl = "https://api.publicapis.org/entries";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
        ),
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<User>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User> users = snapshot.data as List<User>;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            // Text(users[index].name),
                            Text(users[index].API),
                            Text(users[index].Description),

                            //Text(users[index].gender),
                          ],
                        ),
                      );
                    }
                );
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Text('error');
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }


}

class User {
  //int id;
  //String name;
  String API;
  String Description;

  User(
      {
        //required this.id,
        //  required this.name,
        required this.API,
        required this.Description
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // id: json['id'],
      Description: json['Description'],
      API: json['API'].toString(),
      //gender: json['gender']
    );
  }
}