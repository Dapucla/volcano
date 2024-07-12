import 'package:flutter/material.dart';

void showCustomBottomSheet(
    {required BuildContext context, required Widget child}) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.2,
              maxHeight: MediaQuery.of(context).size.height * 0.6),
          child: SafeArea(top: false, child: child)));
}
