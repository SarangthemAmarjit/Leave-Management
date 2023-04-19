import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          // horizontal: 26,
          vertical: 8),
      child: OnHoverButton(
        child: Container(
          height: 32,
          width: 300,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
              border: Border.all(color: Colors.grey)),
          child: const TextField(
            decoration: InputDecoration(
              // hoverColor: Colors.red,

              suffixIcon: Icon(Icons.search),
              border: InputBorder.none,
              // hintText: ""
            ),
          ),
        ),
      ),
    );
  }
}

class OnHoverButton extends StatefulWidget {
  final Widget child;
  const OnHoverButton({super.key, required this.child});

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        transform: transform,
        duration: const Duration(milliseconds: 200),
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
