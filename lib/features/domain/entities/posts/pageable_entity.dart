import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/posts/sort_entity.dart';

class PageableEntity extends Equatable {
  final int? offset;
  final SortEntity? sort;
  final bool? paged;
  final int? pageNumber;
  final int? pageSize;
  final bool? unpaged;

  const PageableEntity(
      {this.offset,
      this.sort,
      this.paged,
      this.pageNumber,
      this.pageSize,
      this.unpaged});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [offset, sort, paged, pageNumber, pageSize, unpaged];
}
