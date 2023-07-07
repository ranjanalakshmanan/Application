class ip {
  String? ib;

  ip({this.ib});

  ip.fromJson(Map<String, dynamic> json) {
    ib = json['ip'];
  }
ip.FromJson(Map<String, dynamic> json) {
    ib= json['time'].toString();


  }
}