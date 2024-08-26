import 'package:trekr_second/features/data/models/posts/sort_model.dart';

class PageableModel {
  int? offset;
  SortModel? sort;
  bool? paged;
  int? pageNumber;
  int? pageSize;
  bool? unpaged;

  PageableModel(
      {this.offset,
      this.sort,
      this.paged,
      this.pageNumber,
      this.pageSize,
      this.unpaged});

  PageableModel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    sort = json['sort'] != null ? SortModel.fromJson(json['sort']) : null;
    paged = json['paged'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['paged'] = paged;
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['unpaged'] = unpaged;
    return data;
  }
}
