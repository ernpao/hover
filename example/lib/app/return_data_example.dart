import 'package:flutter/material.dart';
import 'package:hover/hover.dart';
import 'package:hover/hover_widgets.dart';

class ReturnDataPage extends HoverPage {
  @override
  String get routeName => "/return";

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget render(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Type some text to return to the previous screen:"),
        TextField(controller: _controller),
        CallToActionButton(
          text: "Return",
          onPressed: () {
            print('Input text: ${_controller.value.text}');
            Hover.router.pop(context, _controller.value.text);
          },
        ),
      ],
    );
  }
}
