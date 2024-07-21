import 'package:equatable/equatable.dart';
import 'package:favourite_item_bloc/models/favourite-item-model.dart';
import 'package:favourite_item_bloc/utils/enum.dart';

class FavouriteItemState extends Equatable {
  final List<FavouriteItemModel> favouriteItems;
  final ListStatus listStatus;

  @override
  List<Object?> get props => [favouriteItems, listStatus];

  const FavouriteItemState({this.favouriteItems = const [], this.listStatus = ListStatus.loading});

  FavouriteItemState copyWith({List<FavouriteItemModel>? favouriteItems, ListStatus? listStatus, List<int>? favouriteItemIds}) {
    return FavouriteItemState(favouriteItems: favouriteItems ?? this.favouriteItems, listStatus: listStatus ?? this.listStatus);
  }
}
