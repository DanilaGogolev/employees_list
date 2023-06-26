import 'package:flutter/material.dart';

class RowLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const RowLayout({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 80,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 150, child: Text(title)),
            SizedBox(
              width: 250,
              child: child,
            )
          ],
        ),
      );
}
