import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigma_tech_task/presentation/helper/index.dart';
import 'package:sigma_tech_task/presentation/widgets/custom_elevated_button.dart';
import 'package:sigma_tech_task/presentation/widgets/custom_image_view.dart';

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
                        30.heightBox,
                        SizedBox(
                          height: 80.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (c, i) {
                              final user = home.selectedUsers[i];
                              return Column(
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      CustomImageView(
                                        height: 50.h,
                                        width: 50.w,
                                        imagePath: user.image,
                                      ),
                                      Positioned(
                                        top: -5.h,
                                        right: -10.w,
                                        child: InkWell(
                                          onTap: () => home.deselectUser(user),
                                          radius: 15.r,
                                          child: Container(
                                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                            child: Icon(Icons.close, color: Colors.red, size: 20.sp,),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  5.heightBox,
                                  Text(user.username ?? ''),
                                ],
                              );
                            },
                            separatorBuilder: (c, i) => 15.widthBox,
                            itemCount: home.selectedUsers.length,
                          ),
                        ),
                        10.heightBox,
                        // TODO: search
                        30.heightBox,
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (c, i) {
                              final user = home.users[i];
                              final selected = home.selectedUsers.contains(user);
                              return Row(
                                children: [
                                  CustomImageView(
                                    height: 70.h,
                                    width: 70.w,
                                    imagePath: user.image,
                                  ),
                                  10.widthBox,
                                  Text(user.username ?? '',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700)),
                                  const Spacer(),
                                  CustomElevatedButton(
                                    onTap: () => selected ? home.deselectUser(user) : home.selectUser(user),
                                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                                    text: selected ? 'Remove' : 'Add',
                                    buttonTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: Colors.white),
                                    decoration: BoxDecoration(
                                      color: selected ? Colors.red : Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (c, i) => 20.heightBox,
                            itemCount: home.users.length,
                          ),
                        ),
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
