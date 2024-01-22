import 'package:flutter/cupertino.dart';
import 'package:sigma_tech_task/core/utils/app_toast.dart';
import 'package:sigma_tech_task/data/models/user.dart';
import 'package:sigma_tech_task/data/utils/api_path.dart';
import 'package:sigma_tech_task/data/utils/api_service.dart';

class UsersRepo{
  static int? _total;
  static Future<List<User>> getUsers(int limit) async{
    try {
      // checks if the user has loaded the whole list
      if(_total != null && limit > _total!){
        AppToast.toast(msg: 'You\'ve reached the end of the list');
      }
      // call get request using ApiService function
      final response = await ApiService.getApi(ApiPaths.getUsers, params: {'limit': limit});
      if(response.statusCode == 200){
        _total = response.data['total'];
        return (response.data['users'] as List?)?.map((e) => User.fromJson(e)).toList()??[];
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    // in case of exception or bad statusCode
    return [];
  }
}