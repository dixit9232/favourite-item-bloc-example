import 'package:bloc/bloc.dart';
import 'package:favourite_item_bloc/favourite-item-bloc/favourite-item-event.dart';
import 'package:favourite_item_bloc/favourite-item-bloc/favourite-item-state.dart';
import 'package:favourite_item_bloc/repository/favourite-item-repository.dart';
import 'package:favourite_item_bloc/utils/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/favourite-item-model.dart';

class FavouriteItemBloc extends Bloc<FavouriteItemEvent, FavouriteItemState> {
  FavouriteItemRepository favouriteItemRepository;
  List<FavouriteItemModel> favouriteItemList = [];

  FavouriteItemBloc(super.initialState, this.favouriteItemRepository) {
    on<FetchItemList>(fetchItemList);
    on<AddItemInFavouriteList>(addItemInFavouriteItemList);
    on<RemoveItemInFavouriteList>(removeItemInFavouriteList);
    on<DeleteItemInFavouriteList>(deleteItemInFavouriteList);
    on<PermanentDeleteItemInFavouriteList>(permanentDeleteItemInFavouriteList);
  }

  Future<void> fetchItemList(FetchItemList event, Emitter<FavouriteItemState> emit) async {
    await favouriteItemRepository.fetchItemList(length: 20).then(
      (value) {
        favouriteItemList = value;
        emit(state.copyWith(listStatus: ListStatus.success, favouriteItems: List.from(favouriteItemList)));
      },
    );
  }

  void addItemInFavouriteItemList(AddItemInFavouriteList event, Emitter<FavouriteItemState> emit) {
    int index = favouriteItemList.indexWhere(
      (element) => element.id == event.item.id,
    );
    favouriteItemList[index] = event.item;
    emit(state.copyWith(favouriteItems: List.from(favouriteItemList)));
  }

  void removeItemInFavouriteList(RemoveItemInFavouriteList event, Emitter<FavouriteItemState> emit) {
    int index = favouriteItemList.indexWhere((element) => element.id == event.item.id);
    favouriteItemList[index] = event.item;
    emit(state.copyWith(favouriteItems: List.from(favouriteItemList)));
  }

  void deleteItemInFavouriteList(DeleteItemInFavouriteList event, Emitter<FavouriteItemState> emit) {
    int index = favouriteItemList.indexWhere((element) => element.id == event.item.id);
    favouriteItemList[index] = event.item;
    emit(state.copyWith(favouriteItems: List.from(favouriteItemList)));
  }

  void permanentDeleteItemInFavouriteList(PermanentDeleteItemInFavouriteList event, Emitter<FavouriteItemState> emit) {
    favouriteItemList.removeWhere(
      (element) => element.isDelete,
    );
    emit(state.copyWith(favouriteItems: List.from(favouriteItemList)));
  }
}
