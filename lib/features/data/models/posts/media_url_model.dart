import 'package:trekr_second/features/domain/entities/posts/media_url_entity.dart';

class MediaUrlsModel extends MediaUrlEntity {
  int? id;
  String? type;
  String? url;

  MediaUrlsModel({this.id, this.type, this.url});

  MediaUrlsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}
