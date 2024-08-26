import 'package:trekr_second/features/domain/entities/posts/sort_entity.dart';

class SortModel extends SortEntity {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  SortModel({this.empty, this.sorted, this.unsorted});

  SortModel.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empty'] = empty;
    data['sorted'] = sorted;
    data['unsorted'] = unsorted;
    return data;
  }
}
