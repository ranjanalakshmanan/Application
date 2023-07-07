import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api.dart';

class listapi extends StatefulWidget {
  const listapi({Key? key}) : super(key: key);

  @override
  State<listapi> createState() => _listapiState();
}

class _listapiState extends State<listapi> {
  late Future<List<User>> _future;



  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse(apiUrl));
    return (json.decode(response.body)['entries'] as List).map((e) =>
        User.fromJson(e)).toList();
  }
  final String apiUrl = "https://api.publicapis.org/entries";


  @override
  void initState() {
  super.initState();
  _future = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('calculate at the entries'),
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
                             Text(users[index].API),
                            Text(users[index].Description),
                            Text(users[index].HTTPS),
                            Text(users[index].Auth),

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
  String API;
String Description;
String Auth;
String HTTPS;

User(
    {

      required this.API,
      required this.Description,
      required this.Auth,
      required this.HTTPS,
    });

factory User.fromJson(Map<String, dynamic> json) {
return User(
  Description: json['Description'],
API: json['API'].toString(),
    Auth:["Auth"].toString(),
    HTTPS:["HTTPS"].toString(),

);
}
}


























