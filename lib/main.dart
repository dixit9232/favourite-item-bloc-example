import 'package:favourite_item_bloc/favourite-item-bloc/favourite-item-bloc.dart';
import 'package:favourite_item_bloc/favourite-item-bloc/favourite-item-state.dart';
import 'package:favourite_item_bloc/repository/favourite-item-repository.dart';
import 'package:favourite_item_bloc/views/item-views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavouriteItemBloc(
        const FavouriteItemState(),
        FavouriteItemRepository(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.teal,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[900],
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.teal,
            textTheme: ButtonTextTheme.primary,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.teal,
          ),
        ),
        home: const FavouriteItemView(),
      ),
    );
  }
}
