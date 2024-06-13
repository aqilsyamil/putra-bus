import 'package:app/src/widgets/list_items/column_items.dart';
import 'package:app/src/widgets/list_items/row_items.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationSearchFields extends HookConsumerWidget {
  const NavigationSearchFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 20),
        child: ColumnItems(
          gap: 10.0,
          children: [
            NavigationSearchFieldWithButton(
                labelText: 'Start Location', icon: Icons.close),
            NavigationSearchFieldWithButton(
                labelText: 'End Location', icon: Icons.swap_vert)
          ],
        ));
  }
}

class NavigationSearchFieldWithButton extends HookConsumerWidget {
  const NavigationSearchFieldWithButton(
      {super.key, required this.labelText, required this.icon});

  final String labelText;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RowItems(
      gap: 10,
      children: [
        Flexible(
            child: NavigationSearchField(
          labelText: labelText,
        )),
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
      ],
    );
  }
}

class NavigationSearchField extends HookConsumerWidget {
  const NavigationSearchField({super.key, required this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
        decoration: InputDecoration(
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true, // Set to true for a filled background
      fillColor: Colors.grey[200], // Change this to the grey color you prefer
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    ));
  }
}
