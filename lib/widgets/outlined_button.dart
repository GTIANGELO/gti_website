import 'package:flutter/material.dart';

class TextOutlinedButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final double fontSize;
  final double borderRadius;

  const TextOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = Colors.blue,
    this.fontSize = 16.0,
    this.borderRadius = 8.0,
  });

  @override
  State<TextOutlinedButton> createState() => _TextOutlinedButtonState();
}

class _TextOutlinedButtonState extends State<TextOutlinedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovered ? widget.color : Colors.transparent,
          border: Border.all(color: widget.color),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            onTap: widget.onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: _isHovered ? Colors.white : widget.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
