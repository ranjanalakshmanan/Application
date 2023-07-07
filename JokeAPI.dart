import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ModelClassJoke.dart';

class JokeAPI extends StatefulWidget {
  const JokeAPI({Key? key}) : super(key: key);
  @override
  State<JokeAPI> createState() => _JokeAPIState();
}

class _JokeAPIState extends State<JokeAPI> {

  Future<Joke> fetchDetails() async {
    var response = await http.get(
        Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    print(response.body);
    return Joke.FromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Joke>(
      future: fetchDetails(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.type.toString()),
              Text(snapshot.data!.setup.toString()),
              Text(snapshot.data!.punchline.toString()),
              Text(snapshot.data!.id.toString()),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
