import 'package:flutter/cupertino.dart';
import 'package:sigma_tech_task/data/models/user.dart';
import 'package:sigma_tech_task/data/utils/api_path.dart';
import 'package:sigma_tech_task/data/utils/api_service.dart';

class UsersRepo{
  static Future<List<User>> getUsers(int limit) async{
    try {
      // call get request using ApiService function
      final response = await ApiService.getApi(ApiPaths.getUsers, params: {'limit': limit});
        print(response.data);
      if(response.statusCode == 200){
        return (response.data['users'] as List?)?.map((e) => User.fromJson(e)).toList()??[];
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    // in case of exception or bad statusCode
    return [];
  }
}