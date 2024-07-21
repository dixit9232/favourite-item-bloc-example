import 'package:favourite_item_bloc/favourite-item-bloc/favourite-item-bloc.dart';
import 'package:favourite_item_bloc/favourite-item-bloc/favourite-item-event.dart';
import 'package:favourite_item_bloc/models/favourite-item-model.dart';
import 'package:favourite_item_bloc/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../favourite-item-bloc/favourite-item-state.dart';

class FavouriteItemView extends StatefulWidget {
  const FavouriteItemView({super.key});

  @override
  State<FavouriteItemView> createState() => _FavouriteItemViewState();
}

class _FavouriteItemViewState extends State<FavouriteItemView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteItemBloc>().add(FetchItemList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Item Example in bloc"),
        actions: [
          BlocBuilder<FavouriteItemBloc, FavouriteItemState>(builder: (context, state) {
            if ((state.favouriteItems.any((element) => element.isDelete))) {
              return IconButton(
                  onPressed: () {
                    context.read<FavouriteItemBloc>().add(PermanentDeleteItemInFavouriteList());
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ));
            }
            return const SizedBox();
          })
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocBuilder<FavouriteItemBloc, FavouriteItemState>(
          builder: (context, state) {
            if (state.listStatus == ListStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.listStatus == ListStatus.failed) {
              return const Center(child: Text("An error occurred while fetching a List"));
            } else {
              return ListView.builder(
                itemCount: state.favouriteItems.length,
                itemBuilder: (context, index) {
                  if (state.favouriteItems.isEmpty) {
                    return const Center(child: Text("No data found"));
                  }
                  final data = state.favouriteItems[index];
                  return Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text(
                        data.item,
                        style: (data.isDelete) ? TextStyle(decoration: TextDecoration.lineThrough, decorationColor: Colors.red, color: Colors.redAccent.shade100) : null,
                      ),
                      leading: Checkbox(
                        value: data.isDelete,
                        onChanged: (value) {
                          FavouriteItemModel favouriteItemModel = FavouriteItemModel(id: data.id, item: data.item, isFavourite: data.isFavourite, isDelete: value!);
                          context.read<FavouriteItemBloc>().add(DeleteItemInFavouriteList(item: favouriteItemModel));
                        },
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            if (data.isFavourite) {
                              FavouriteItemModel favouriteItemModel = FavouriteItemModel(id: data.id, item: data.item, isFavourite: false, isDelete: data.isDelete);
                              context.read<FavouriteItemBloc>().add(RemoveItemInFavouriteList(item: favouriteItemModel));
                            } else {
                              FavouriteItemModel favouriteItemModel = FavouriteItemModel(id: data.id, item: data.item, isFavourite: true, isDelete: data.isDelete);

                              context.read<FavouriteItemBloc>().add(AddItemInFavouriteList(item: favouriteItemModel));
                            }
                          },
                          icon: (data.isFavourite)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                )),
                    ),
                  );
                },
              );
            }
          },
        ),
      )),
    );
  }
}
