import 'dart:async';

import 'package:flutter/material.dart';

/// A TextField that debounces [onChanged] to avoid rapid state updates while typing.
final class DebouncedTextField extends StatefulWidget {
  const DebouncedTextField({
    required this.initialValue,
    required this.onChanged,
    super.key,
    this.hintText,
    this.textDirection,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.decoration,
  });

  final String initialValue;
  final void Function(String value) onChanged;
  final String? hintText;
  final TextDirection? textDirection;
  final Duration debounceDuration;
  final InputDecoration? decoration;

  @override
  State<DebouncedTextField> createState() => _DebouncedTextFieldState();
}

class _DebouncedTextFieldState extends State<DebouncedTextField> {
  late TextEditingController _controller;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(DebouncedTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue && _controller.text != widget.initialValue) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(widget.debounceDuration, () {
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final child = TextField(
      controller: _controller,
      decoration:
          widget.decoration ??
          InputDecoration(
            hintText: widget.hintText,
            isDense: true,
          ),
      onChanged: _onChanged,
    );

    if (widget.textDirection != null) {
      return Directionality(
        textDirection: widget.textDirection!,
        child: child,
      );
    }
    return child;
  }
}
