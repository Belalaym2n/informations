import 'dart:convert';


import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'package:news_app/home_layout/cubite/states.dart';

import '../../models/everything_model.dart';
import '../../models/sources_model.dart';
import '../../shared/componets/constants.dart';

class HomeCubit extends Cubit<HomeState> {
  List<Sources> sourcesList = [];
  List<Articles> articlesList = [];

  int index = 0;

  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  changeSources(int value){

    emit(HomeChangeSourcesState());
    index=value;
    emit(HomeInitState());

  }

  Future<void> getSources(String catId) async {
    emit(HomeGetSourcesLoadingState());
    Uri uri = Uri.https(base_url, "/v2/top-headlines/sources",
        {"apiKey": apiKey, "category": catId});
    try {
      HomeGetSourcesSuccesState();
      http.Response response = await http.get(uri);
      var jsonData = jsonDecode(response.body);
      SourcesModel sourcesModel = SourcesModel.fromJson(jsonData);
      sourcesList = sourcesModel.sources ?? [];


      print("object");


    } catch (e) {
      HomeGetSourcesErorrState();


      throw e;
    }
  }

  Future<void> getEverythink({ String? searchkeyword}) async {
    emit(HomeGetNewsLoadingState());

    Uri uri = Uri.https(base_url, "/v2/everything",
        {"apiKey": apiKey, 'sources': sourcesList[index].id, "q": searchkeyword});
    try {
      Response response = await http.get(uri);
      var responData = jsonDecode(response.body);

      EverythingModel everythingModel = EverythingModel.fromJson(responData);

      articlesList = everythingModel.articles ?? [];
      emit(HomeGetSourcesSuccesState());

      emit(HomeGetNewsSuccesState());


    } catch (e) {
      emit(HomeGetNewsErorrState());
      throw e;
    }
  }
}
