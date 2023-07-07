import 'dart:convert';
import 'package:application/Model/ActivityClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ActivityAPI extends StatefulWidget {
  const ActivityAPI({Key? key}) : super(key: key);

  @override
  State<ActivityAPI> createState() => _ActivityAPIState();
}

class _ActivityAPIState extends State<ActivityAPI> {

  Future<Activity> fetchDetails() async {
    var response = await http.get(
        Uri.parse("https://www.boredapi.com/api/activity"));
    print(response.body);
    return Activity.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Activity>(
      future: fetchDetails(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.activity.toString()),
              Text(snapshot.data!.type.toString()),
              Text(snapshot.data!.participants.toString()),
              Text(snapshot.data!.price.toString()),
              Text(snapshot.data!.link.toString()),
              Text(snapshot.data!.key.toString()),
              Text(snapshot.data!.accessibility.toString()),

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
