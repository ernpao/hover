import 'package:flutter/material.dart';

class HoverTextInput extends StatefulWidget {
  HoverTextInput({
    this.controller,
    this.hintText,
    this.iconColor,
    this.elevation,
    this.backgroundColor,
    this.hintTextColor,
    this.hintTextFontSize,
    this.hintTextFontStyle,
    this.hintTextFontWeight,
    this.onSubmitted,
    this.clearOnSubmit,
    this.width,
    this.enabled,
    this.focusNode,
  });

  /// The maximum width of this widget (including the margins).
  final double? width;

  /// Function to call upon submission of the user's input (i.e. enter key is pressed).
  final Future<void> Function(String query)? onSubmitted;

  /// Hint text to display.
  final String? hintText;

  /// Color to use for the icon for clearing text.
  final Color? iconColor;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  final double? elevation;

  final Color? backgroundColor;

  /// Color of the hint text.
  final Color? hintTextColor;

  /// Font style of the hint text.
  final FontStyle? hintTextFontStyle;

  /// Font size of the hint text.
  final double? hintTextFontSize;

  /// Font weight of the hint text.
  final FontWeight? hintTextFontWeight;

  final TextEditingController? controller;

  final bool? clearOnSubmit;

  final bool? enabled;

  final FocusNode? focusNode;

  @override
  State<StatefulWidget> createState() {
    return _HoverTextInputState();
  }
}

class _HoverTextInputState extends State<HoverTextInput> {
  late TextEditingController _controller;
  bool get _hasText => _controller.text.isNotEmpty;
  String get _userQuery => _controller.value.text;
  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(() {
      // Calling setState is required to toggle visibility of clear text icon
      setState(() => {});
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
              _spacer,
              Expanded(
                child: TextField(
                  onSubmitted: (query) async {
                    await widget.onSubmitted?.call(_userQuery);
                    if (widget.clearOnSubmit ?? false) _controller.clear();
                  },
                  focusNode: widget.focusNode,
                  enabled: widget.enabled,
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
