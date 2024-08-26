import 'package:trekr_second/features/data/models/posts/content_model.dart';
import 'package:trekr_second/features/data/models/posts/pageable_model.dart';
import 'package:trekr_second/features/data/models/posts/sort_model.dart';
import 'package:trekr_second/features/domain/entities/posts/feed_entity.dart';

class FeedModel extends FeedEntity {
  int? totalPages;
  int? totalElements;
  int? size;
  List<ContentModel>? content;
  int? number;
  SortModel? sort;
  int? numberOfElements;
  PageableModel? pageables;
  bool? first;
  bool? last;
  bool? empty;

  FeedModel(
      {this.totalPages,
      this.totalElements,
      this.size,
      this.content,
      this.number,
      this.sort,
      this.numberOfElements,
      this.pageables,
      this.first,
      this.last,
      this.empty});

  FeedModel.fromJson(Map<String, dynamic> json) {
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    size = json['size'];
    if (json['content'] != null) {
      content = <ContentModel>[];
      json['content'].forEach((v) {
        content!.add(ContentModel.fromJson(v));
      });
    }
    number = json['number'];
    sort = json['sort'] != null ? SortModel.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    pageables = json['pageable'] != null
        ? PageableModel.fromJson(json['pageable'])
        : null;
    first = json['first'];
    last = json['last'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    data['size'] = size;
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    data['number'] = number;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['numberOfElements'] = numberOfElements;
    if (pageable != null) {
      data['pageable'] = pageables!.toJson();
    }
    data['first'] = first;
    data['last'] = last;
    data['empty'] = empty;
    return data;
  }

  static List<FeedModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => FeedModel.fromJson(json)).toList();
  }
}
