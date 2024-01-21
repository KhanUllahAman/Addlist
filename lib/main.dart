import 'package:addlist/favourite_list.dart';
import 'package:addlist/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FavouriteApp());
}



class FavouriteApp extends StatelessWidget {
  const FavouriteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      
      create: (context) => FavouriteProvider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FavouriteList(),
    ),

    );
  }
}
