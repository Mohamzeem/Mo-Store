import 'package:flutter/material.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/empty_error_container.dart';

class ErrorContainer extends StatelessWidget {
  final String text;
  const ErrorContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: EmptyErrorContainer(
        text: 'No $text Found',
        height: 160,
      ),
    );
  }
}
