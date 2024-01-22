import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigma_tech_task/presentation/helper/index.dart';
import 'package:sigma_tech_task/presentation/widgets/custom_elevated_button.dart';
import 'package:sigma_tech_task/presentation/widgets/custom_image_view.dart';

import '../cubit/home_cubit.dart';

class UsersView extends StatelessWidget {
  UsersView({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit home = context.read();
        return NotificationListener<ScrollNotification>(
          onNotification: (notify) {
            if(notify is ScrollEndNotification && notify.metrics.extentAfter == 0)  home.loadMoreUsers();
            return false;
          },
          child: ListView(
            controller: controller,
            shrinkWrap: true,
            children: home.users.where((user) => user.username!.toLowerCase().contains(home.search)).map((user) {
              final selected = home.selectedUsers.contains(user);
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
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
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
