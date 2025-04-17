import 'package:flutter/material.dart';

class HoverSearchBar extends StatefulWidget {
  HoverSearchBar({
    this.onChanged,
    this.hintText,
    this.iconColor,
    this.elevation,
    this.backgroundColor,
    this.hintTextColor,
    this.hintTextFontSize,
    this.hintTextFontStyle,
    this.hintTextFontWeight,
    this.onSubmitted,
    this.initialText,
    this.clearOnSubmit = false,
    this.width,
  });

  /// The maximum width of this widget (including the margins).
  final double? width;

  /// Function to call when the search bar input changes.
  final Function(String query)? onChanged;

  /// Function to call upon submission of the user's search query (i.e. enter key is pressed).
  final Function(String query)? onSubmitted;

  /// Hint text to display on the search bar.
  final String? hintText;

  /// Color to use for the search icon.
  final Color? iconColor;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  final double? elevation;

  /// Background color of the search bar.
  final Color? backgroundColor;

  /// Color of the hint text.
  final Color? hintTextColor;

  /// Font style of the hint text.
  final FontStyle? hintTextFontStyle;

  /// Font size of the hint text.
  final double? hintTextFontSize;

  /// Font weight of the hint text.
  final FontWeight? hintTextFontWeight;

  final String? initialText;

  final bool clearOnSubmit;
  @override
  State<StatefulWidget> createState() {
    return _HoverSearchBarState();
  }
}

class _HoverSearchBarState extends State<HoverSearchBar> {
  late TextEditingController _controller;
  late String _prevValue;
  String get _currentValue => _controller.value.text;
  bool get _hasText => _controller.text.isNotEmpty;

  @override
  void initState() {
    _controller = TextEditingController();
    _prevValue = widget.initialText ?? "";
    _controller.text = widget.initialText ?? "";
    _controller.addListener(() {
      if (_currentValue != _prevValue) {
        print("onChanged triggered!");
        widget.onChanged?.call(_currentValue);
      }
      // Calling setState is required to toggle visibility of clear text icon
      setState(() => _prevValue = _currentValue);
    });

    super.initState();
  }

  static const _cardPadding = 16.0;
  static const _cardMargin = 12.0;
  static const _cornerRadius = _cardPadding * 2;
  static const _spacer = SizedBox(width: 8.0);

  Color _getHintColor(BuildContext context) {
    final theme = Theme.of(context);
    return (theme.brightness == Brightness.dark)
        ? Colors.white38
        : Colors.black38;
  }

  void _submit(String query) {
    widget.onSubmitted?.call(_currentValue);
    if (widget.clearOnSubmit) _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final _defaultContentColor = _getHintColor(context);

    return SizedBox(
      width: widget.width,
      child: Card(
        margin: EdgeInsets.all(_cardMargin),
        color: widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cornerRadius),
        ),
        elevation: widget.elevation,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _cardPadding),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: widget.iconColor ?? _defaultContentColor,
              ),
              _spacer,
              Expanded(
                child: TextField(
                  onSubmitted: _submit,
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText ?? "",
                    hintStyle: TextStyle(
                      color: widget.hintTextColor ?? _defaultContentColor,
                      fontWeight: widget.hintTextFontWeight,
                      fontSize: widget.hintTextFontSize,
                      fontStyle: widget.hintTextFontStyle,
                    ),
                  ),
                ),
              ),
              _spacer,
              _hasText
                  ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: widget.iconColor ?? _defaultContentColor,
                      ),
                      onPressed: _controller.clear,
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
