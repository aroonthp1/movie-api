
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapi/moviemodel.dart';
import 'package:http/http.dart' as http;

final movieProvider = StateNotifierProvider<MovieProvider,List<MovieModel>>((ref)=>movieProvider());


class MovieProvider extends StateNotifier<List<MovieModel>> {
  MovieProvider([List<MovieModel> state]) : super(state ?? []){
    getData();
  }



Future<void> getData() async {

    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=030938880274387e5d48cd767fbaf306&language=en-US&page=1'));////movie api
    final data = jsonDecode(response.body);//as List;
    //final listData = (data as List).map((e) =>MovieModel.fromJson(e)).toList();//
    List<MovieModel> listData= data.map((e) =>e ).toList();
    print('listData');
    state = [...state, ...listData];
  }


}