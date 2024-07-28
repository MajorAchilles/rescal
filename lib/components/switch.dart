import 'dart:ffi';

import 'package:flutter/material.dart';

const _backgroundDarkMode = Color(0xFF2E2F38);
const _backgroundLightMode = Colors.white;
const _iconColor = Color(0xFF4B5EFC);
const _switchColorDarkMode = Color(0xFF4E505F);
const _switchColorLightMode = Color(0xFFD2D3DA);
const _innerSize = 28.0;
const Duration _animationDuration = Duration(milliseconds: 150);

class RescalSwitch extends StatefulWidget {
  final bool value;
  final bool isDarkMode;
  final void Function(bool) onChanged;
  const RescalSwitch({super.key, required this.value, required this.onChanged, required this.isDarkMode});

  @override
  State<RescalSwitch> createState() => _RescalSwitchState();
}

class _RescalSwitchState extends State<RescalSwitch> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: _animationDuration,
        height: 32,
        width: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.isDarkMode ? _backgroundDarkMode : _backgroundLightMode,
        ),
        child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  widget.onChanged(!widget.value);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: AnimatedSwitcher(
                    duration: _animationDuration,
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: widget.value ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      key: const Key('onState'),
                      children: [
                        const Icon(Icons.wb_sunny_outlined, color: _iconColor, size: _innerSize),
                        Container(
                          width: _innerSize,
                          height: _innerSize,
                          decoration: BoxDecoration(
                            color: _switchColorLightMode,
                            borderRadius: BorderRadius.circular(_innerSize),
                          ),
                        ),
                      ],
                    ) : Row(
                      key: const Key('offState'),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: _innerSize,
                          height: _innerSize,
                          decoration: BoxDecoration(
                            color: _switchColorDarkMode,
                            borderRadius: BorderRadius.circular(_innerSize),
                          ),
                        ),
                        Transform.rotate(angle: 0.7, child: const Icon(Icons.mode_night_outlined, color: _iconColor, size: _innerSize)),
                      ],
                    ),
                  ),
                )
              )
      );
  }
}