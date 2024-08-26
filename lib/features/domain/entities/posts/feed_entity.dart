import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/posts/content_entity.dart';
import 'package:trekr_second/features/domain/entities/posts/pageable_entity.dart';
import 'package:trekr_second/features/domain/entities/posts/sort_entity.dart';

class FeedEntity extends Equatable {
  final int? totalPages;
  final int? totalElements;
  final int? size;
  final List<ContentEntity>? content;
  final int? number;
  final SortEntity? sort;
  final int? numberOfElements;
  final PageableEntity? pageable;
  final bool? first;
  final bool? last;
  final bool? empty;

  const FeedEntity(
      {this.totalPages,
      this.totalElements,
      this.size,
      this.content,
      this.number,
      this.sort,
      this.numberOfElements,
      this.pageable,
      this.first,
      this.last,
      this.empty});
  @override
  // TODO: implement props
  List<Object?> get props => [
        totalPages,
        totalElements,
        size,
        content,
        number,
        sort,
        numberOfElements,
        pageable,
        first,
        last,
        empty
      ];
}
