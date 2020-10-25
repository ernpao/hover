import 'package:flutter/material.dart';

class HoverSearchBar extends StatefulWidget {
  /// Function to call when the search bar input changes.
  final Function(String) onChanged;

  /// Hint text to display on the search bar.
  final String hintText;

  /// Color to use for the search icon.
  final Color iconColor;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  final double elevation;

  HoverSearchBar({
    this.onChanged,
    this.hintText,
    this.iconColor: Colors.black38,
    this.elevation: 1.0,
  });
  @override
  State<StatefulWidget> createState() {
    return _HoverSearchBarState();
  }
}

class _HoverSearchBarState extends State<HoverSearchBar> {
  TextEditingController controller;

  bool hasText;

  @override
  void initState() {
    hasText = false;
    controller = TextEditingController();

    controller.addListener(() {
      widget.onChanged(controller.value.text);
      setState(() {
        hasText = controller.text.isNotEmpty;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        margin: EdgeInsets.all(12),
        elevation: widget.elevation,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: .0,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: widget.iconColor,
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    contentPadding: EdgeInsets.all(0),
                  ),
                ),
              ),
              SizedBox(width: 8),
              hasText
                  ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: widget.iconColor,
                      ),
                      onPressed: () {
                        controller.clear();
                      },
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
