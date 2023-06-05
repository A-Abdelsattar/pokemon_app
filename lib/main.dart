
import 'package:flutter/material.dart';
import 'package:pokemon_app/service/dio_helper/dio_helper.dart';
import 'package:pokemon_app/src/app_root.dart';


main(){
  DioHelper.init();
  runApp(AppRoot());
}