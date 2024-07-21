import '../models/favourite-item-model.dart';

class FavouriteItemRepository {
  Future<List<FavouriteItemModel>> fetchItemList({required int length}) async {
    await Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        return List.of(_generateFavouriteItemList(length: length));
      },
    );
    return List.of(_generateFavouriteItemList(length: length));
  }

  List<FavouriteItemModel> _generateFavouriteItemList({required int length}) {
    return List.generate(length, (index) => FavouriteItemModel(id: index + 1, item: "item ${index + 1}"));
  }
}
