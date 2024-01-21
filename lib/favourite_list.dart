import 'package:addlist/favourite_items.dart';
import 'package:addlist/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteList extends StatelessWidget {
  FavouriteList({super.key});
  final List itemList = ["Mango", "Apple", "Lychee", "Grapes", "Orange"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: Text("Favourite App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => FavouriteItems(),));
            },

            icon: Icon(Icons.favorite_rounded),
          )
        ],
      ),

      body: ListView.builder(

        itemCount: itemList.length ,

        itemBuilder: (context, index) {
          return Card(
            child: Consumer<FavouriteProvider>(
              builder: (context, value, child) {
                return ListTile(
              title: Text(itemList[index]),
              trailing: IconButton(
                onPressed: () {

                  if(value.favList.contains(itemList[index])){
                    
                    value.removeItem(itemList[index]);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Item removed from favourites"),
                      )
                    );


                  }else{
                    value.addItem(itemList[index]);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Item added to favourites"),
                      )
                    );
                  }


                },
          
                icon: Icon( value.favList.contains(itemList[index])? Icons.favorite_rounded : Icons.favorite_outline_rounded , color: Colors.pink,),
              ),
            );
              },
            )
          );
        },

      )
    );
  }
}