import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigma_tech_task/presentation/helper/index.dart';
import 'package:sigma_tech_task/presentation/pages/home/widgets/selected_users.dart';
import 'package:sigma_tech_task/presentation/pages/home/widgets/users_view.dart';
import 'package:sigma_tech_task/presentation/widgets/custom_search_view.dart';

import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // get users anytime you enter the home screen (in this case "enter the app")
      create: (context) => HomeCubit()..getUsers(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit home = context.read();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add Players'),
              automaticallyImplyLeading: false,
              centerTitle: true,
            ),
            body: state is GetUsersLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        20.heightBox,
                        if (home.selectedUsers.isNotEmpty)const SelectedUsers(),
                        10.heightBox,
                        AppSearch(onChanged: home.searchUsers, controller: home.searchController),
                        20.heightBox,
                        Expanded(child: UsersView()),
                        10.heightBox,
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
