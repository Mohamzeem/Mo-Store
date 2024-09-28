import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/features/admin/data/repo/users_repo.dart';
import 'package:mo_store/features/admin/logic/all_users_cubit/all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  final AllUsersRepo usersRepo;
  AllUsersCubit({required this.usersRepo})
      : super(const AllUsersState.initial());

  Future<void> getAllUsers() async {
    emit(const AllUsersState.loading());

    final result = await usersRepo.getAllUsers();
    result.when(
      success: (users) {
        Prints.debug(
            message: 'allUsersList ${users.usersList.length.toString()}');
        emit(AllUsersState.success(users));
      },
      failure: (message) => emit(AllUsersState.failure(message)),
    );
  }
}
