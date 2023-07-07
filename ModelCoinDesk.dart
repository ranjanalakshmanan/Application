class coindesk {
  String? time;
  String? disclaimer;
  String? chartName;
  String? bpi;

  coindesk({this.time, this.disclaimer, this.chartName, this.bpi});


  coindesk.fromJson(Map<String, dynamic> json) {
    time = json['type'];
     disclaimer= json['setup'];
     chartName= json['punchline'];
    bpi= json['id'];
  }


coindesk.FromJson(Map<String, dynamic> json) {
 time= json['time'].toString();
 disclaimer= json['disclaimer'].toString();
 chartName= json['chartname'].toString();
 bpi= json['bpi'].toString();
}
}





