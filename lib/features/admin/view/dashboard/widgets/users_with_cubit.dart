import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/features/admin/logic/all_users_cubit/all_users_cubit.dart';
import 'package:mo_store/features/admin/logic/all_users_cubit/all_users_state.dart';
import 'package:mo_store/features/admin/view/dashboard/widgets/dashboard_container.dart';
import 'package:mo_store/features/admin/view/dashboard/widgets/error_container.dart';

class UsersContainerWithCubit extends StatelessWidget {
  const UsersContainerWithCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllUsersCubit, AllUsersState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const ErrorContainer(
            text: 'Users',
          ),
          success: (users) => DashboardContainer(
            title: 'Users',
            number: users.usersListNumber,
            image: 'assets/images/pngs/users.png',
          ),
          loading: () => const DashboardContainer(
            isLoading: true,
            title: 'Users',
            number: '',
            image: 'assets/images/pngs/users.png',
          ),
        );
      },
    );
  }
}
