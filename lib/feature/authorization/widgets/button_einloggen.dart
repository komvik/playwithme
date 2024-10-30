import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/feature/navigation_wrapper/screens/navigation_wrapper.dart';

class ButtonEinloggen extends StatelessWidget {
  const ButtonEinloggen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NavigationWrapper()));
      },
      child: Text(
        "     Einloggen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
