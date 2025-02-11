import 'package:flutter/material.dart';
import 'package:mo_store/features/admin/view/admin/widegts/admin_app_bar.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AdminAppBar(
              title: 'Users',
              padding: 20,
            ),
          ],
        ),
      ),
    );
  }
}
