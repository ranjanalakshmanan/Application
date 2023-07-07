class Joke {
 String? type;
 String? setup;
 String? punchline;
 int? id;

 Joke({this.type, this.setup, this.punchline, this.id});

 Joke.fromJson(Map<String, dynamic> json) {
  type = json['type'];
  setup = json['setup'];
  punchline = json['punchline'];
  id = json['id'];
 }

 Joke.FromJson(Map<String, dynamic> json) {
  type = json['type'].toString();
  setup = json['setup'].toString();
  punchline = json['punchline'].toString();
  id = int.parse(json['id'].toString());
 }
}