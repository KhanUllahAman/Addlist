import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier{

  List _favList = [];
  List get favList => _favList;

  addItem( String item ){
    _favList.add(item);
    notifyListeners();
  }


  removeItem( String item ){
    _favList.remove(item);
    notifyListeners();
  }


}