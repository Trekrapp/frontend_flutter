import 'package:equatable/equatable.dart';

class SortEntity extends Equatable {
  final bool? empty;
  final bool? sorted;
  final bool? unsorted;

  const SortEntity({this.empty, this.sorted, this.unsorted});
  @override
  // TODO: implement props
  List<Object?> get props => [empty, sorted, unsorted];
}
