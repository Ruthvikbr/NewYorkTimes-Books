import 'package:flutter/material.dart';
import 'package:new_york_times_books/BLoC/best_seller_bloc.dart';
import 'package:new_york_times_books/UI/Screens/best_sellers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New York Times - Books',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider<BestSellersBloc>(
          create: (_) => BestSellersBloc(),
          dispose: (_, bloc) => bloc.dispose(),
          child: Consumer<BestSellersBloc>(
            builder: (_, bloc, __) => BooksList(bestSellersBloc: bloc),
          )),
    );
  }
}
