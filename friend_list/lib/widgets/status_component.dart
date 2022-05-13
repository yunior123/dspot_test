import 'package:flutter/material.dart';

class StatusComponenet extends StatelessWidget {
  final Widget child;
  const StatusComponenet({
    final Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(final BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(
            177,
            185,
            219,
            1,
          ),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: child,
      ),
    );
  }
}
