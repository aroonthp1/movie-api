import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapi/movieprovider.dart';



class HomePage extends ConsumerWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final  data= watch(movieProvider);/// uta ko data pass garne yo file ma
    return Scaffold(
      body:data.length==0 ? Container(): ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
          final dat= data[index];
          return Column(
            children: [
              Image.network('https://image.tmdb.org/t/p/w600_and_h900_bestv2/${dat.image}'),////
              ListTile(
                title: Text(dat.title) ,
                subtitle: Text(dat.vote_count ),

              ),
            ],
          );

        },
      ) );
      
  
  }
}