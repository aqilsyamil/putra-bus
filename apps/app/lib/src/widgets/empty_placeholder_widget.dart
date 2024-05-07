import 'package:app/src/widgets/button/primary_button.dart';
import 'package:app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholderWidget extends ConsumerWidget {
  const EmptyPlaceholderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            gapH32,
            PrimaryButton(
              onPressed: () {
                // final isLoggedIn =
                //     ref.watch(authRepositoryProvider).currentUser != null;
                // context.goNamed(
                //     isLoggedIn ? AppRoute.jobs.name : AppRoute.signIn.name);
              },
              text: 'Go Home',
            )
          ],
        ),
      ),
    );
  }
}
