import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/features/register/logic/register/register_cubit.dart';
import 'package:mo_store/features/register/logic/register/register_state.dart';

class RegisterRole extends StatefulWidget {
  const RegisterRole({
    super.key,
  });

  @override
  State<RegisterRole> createState() => _RegisterRoleState();
}

class _RegisterRoleState extends State<RegisterRole> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                'Select Role',
                style: TextStyle(
                  color: AppColors.lightBlue,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                width: 150.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.lightBlue, width: 2.w),
                ),
                child: Center(
                  child: DropdownButton<String>(
                    iconEnabledColor: Colors.grey,
                    style: TextStyle(
                        color: AppColors.primaryColor, fontSize: 20.sp),
                    elevation: 10,
                    alignment: Alignment.center,
                    dropdownColor: AppColors.lightGrey,
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    hint: const Text('Role'),
                    onChanged: (value) =>
                        setState(() => cubit.dropDownValue(value!)),
                    value: cubit.selectedRole.isNullOrEmptyString()
                        ? null
                        : cubit.selectedRole,
                    items: cubit.roleList.map((role) {
                      return DropdownMenuItem(
                        value: role,
                        alignment: Alignment.center,
                        child: Text(role),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
