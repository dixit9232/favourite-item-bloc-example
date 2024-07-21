import 'package:equatable/equatable.dart';
import 'package:favourite_item_bloc/models/favourite-item-model.dart';

abstract class FavouriteItemEvent extends Equatable {
  @override
  List<Object?> get props => const [];

  const FavouriteItemEvent();
}

///fetch list
class FetchItemList extends FavouriteItemEvent {}

/// add item in favourite list
class AddItemInFavouriteList extends FavouriteItemEvent {
  final FavouriteItemModel item;

  const AddItemInFavouriteList({required this.item});
}

/// remove in favourite list

class RemoveItemInFavouriteList extends FavouriteItemEvent {
  final FavouriteItemModel item;
  const RemoveItemInFavouriteList({required this.item});
}

/// selection for delete
class DeleteItemInFavouriteList extends FavouriteItemEvent {
  final FavouriteItemModel item;
  const DeleteItemInFavouriteList({required this.item});
}

/// for delete from list
class PermanentDeleteItemInFavouriteList extends FavouriteItemEvent {
}