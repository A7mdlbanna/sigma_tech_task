import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sigma_tech_task/data/repositories/users_repository.dart';

import '../../../../data/models/user.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  int limit = 10;
  List<User> users = [];

  /// get user data using UserRepo
  getUsers({bool loading = true}) async {
    if(loading) emit(GetUsersLoading());
    users = await UsersRepo.getUsers(limit);
    emit(GetUsersDone());
  }

  /// increase the limit param by 10 then call getUsers again
  loadMoreUsers(){
    limit += 10;
    getUsers(loading: false);
  }

  List<User> selectedUsers = [];
  selectUser(User user){
    selectedUsers.add(user);
    emit(SelectUser());
  }

  deselectUser(User user){
    selectedUsers.remove(user);
    emit(DeselectUser());
  }

  TextEditingController searchController = TextEditingController();
  String search = '';
  searchUsers(String search) {
    /// start search after 3 characters to reduce load (if using endpoint search with large amount of users)
    this.search = /*search.length < 3 ? '' :*/ search.toLowerCase();
    emit(SearchUsers());
  }
}
