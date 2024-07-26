import 'package:flutter/material.dart';


class Header extends StatelessWidget {
  final void Function() onSwitch;
  final bool isDarkMode;

  handleSwitchChange (bool value) {
    onSwitch();
  }

  const Header({super.key, required this.onSwitch, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(value: !isDarkMode, onChanged: handleSwitchChange),
        ],
      ),
    );
  }
}