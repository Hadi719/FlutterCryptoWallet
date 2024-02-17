import 'package:flutter/material.dart';

/// Helper class to show a [SnackBar] using the passed context.
///
/// hides existing [SnackBar] and show the new one.
class HelperScaffoldSnackBar {
  final BuildContext _context;

  HelperScaffoldSnackBar(this._context);

  /// The scaffold of current context.
  factory HelperScaffoldSnackBar.of(BuildContext context) {
    return HelperScaffoldSnackBar(context);
  }

  /// Helper method to show a [SnackBar].
  void show(String message) {
    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}
