import 'package:vexana/vexana.dart';

class TvShow extends INetworkModel<TvShow> {
  final double? score;
  final Show? show;

  TvShow({this.score, this.show});

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
        score: json['score'],
        show: json['show'] != null ? Show.fromJson(json['show']) : null);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    if (this.show != null) {
      data['show'] = this.show!.toJson();
    }
    return data;
  }

  @override
  TvShow fromJson(Map<String, dynamic> json) {
    return TvShow.fromJson(json);
  }
}

class Show extends INetworkModel<Show> {
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  String? status;

  Show({this.id, this.url, this.name, this.type, this.language, this.status});

  Show.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    type = json['type'];
    language = json['language'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    data['type'] = this.type;
    data['language'] = this.language;
    data['status'] = this.status;
    return data;
  }

  @override
  Show fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
