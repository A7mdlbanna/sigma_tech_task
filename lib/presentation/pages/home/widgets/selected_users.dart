import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigma_tech_task/presentation/helper/index.dart';
import 'package:sigma_tech_task/presentation/widgets/custom_image_view.dart';

import '../cubit/home_cubit.dart';

class SelectedUsers extends StatelessWidget {
  const SelectedUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit home = context.read();
        return SizedBox(
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
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.close, color: Colors.red, size: 20.sp,),
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
        );
      },
    );
  }
}
