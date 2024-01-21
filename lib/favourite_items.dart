import 'package:addlist/provider/favourite_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteItems extends StatelessWidget {
  const FavouriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Favourite Items"),
        centerTitle: true,
      ),


      body: Consumer<FavouriteProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.favList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(value.favList[index]),

                  trailing: IconButton(
                    onPressed: () {

                      showDialog(
                        context: context,
                        builder: (context) {

                          return AlertDialog(
                            title: Text("Remove"),
                            content: Text("Are you sure you want to remove this item?"),

                            actions: [

                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No"),
                              ),



                              TextButton(
                                onPressed: () {
                                  value.removeItem(value.favList[index]);
                                  Navigator.pop(context);
                                  
                                },
                                child: Text("Yes"),
                              ),


                            ],
                          );
                          
                        },
                      );
                      
                    },

                    icon: Icon(Icons.favorite_rounded, color: Colors.pink,),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}