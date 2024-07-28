import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/features/profile/logic/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());
}
