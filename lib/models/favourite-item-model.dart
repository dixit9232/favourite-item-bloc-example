import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  const FavouriteItemModel({
    required this.id,
    required this.item,
    this.isFavourite = false,
    this.isDelete = false,
  });

  final int id;
  final String item;
  final bool isFavourite;
  final bool isDelete;

  FavouriteItemModel copyWith({
    int? id,
    String? item,
    bool? isFavourite,
    bool? isDelete,
  }) {
    return FavouriteItemModel(id: id ?? this.id, item: item ?? this.item, isDelete: isDelete ?? this.isDelete, isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  List<Object?> get props => [id, item, isFavourite, isDelete];
}
