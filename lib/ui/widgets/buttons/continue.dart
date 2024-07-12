import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/styles.dart';

class DContinueButton extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final bool isLoaded;
  final double? padding;
  final bool enabled;

  const DContinueButton({
    Key? key,
    required this.onTap,
    required this.name,
    this.isLoaded = false,
    this.enabled = true,
    this.padding = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: kSmallBorderRadius,
      onTap: (!isLoaded && enabled) ? onTap : null,
      child: Opacity(
        opacity: enabled ? 1.0 : 0.5, // Change opacity based on enabled state
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: kSmallBorderRadius,
          ),
          padding: EdgeInsets.all(padding ?? kDefaultPadding),
          child: isLoaded
              ? const Center(child: CupertinoActivityIndicator())
              : Text(
            name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: kWhiteText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
