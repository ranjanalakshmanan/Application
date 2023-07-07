import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api extends StatefulWidget {
  const api({Key? key}) : super(key: key);

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {


  late Future<List<User>> _future;

  @override
  void initState() {
    super.initState();

    _future = fetchUsers();
  }

  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse(apiUrl));
    return (json.decode(response.body)['country'] as List).map((e) =>
        User.fromJson(e)).toList();
  }
  final String apiUrl = "https://api.nationalize.io?name=nathaniel";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("calculate in Json method"),
      ),
      body: Container(
        color: Colors.cyan,
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List<User>>(
          future: fetchUsers(),
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
                          Text(users[index].country ),
                        ],
                      ),
                    );
                  }
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text('values');
            }
            return CircularProgressIndicator();
          },
        ),
      ));
  }
}
class User {
  String country;

  User({
    required this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print(json);
    return User(
      country: json["country_id"].toString(),

    );
  }

}
