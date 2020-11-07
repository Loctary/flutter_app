import 'package:flutter/material.dart';

class AsyncRaisedButton extends StatefulWidget {
  final Function onPressed;
  final Text text;

  const AsyncRaisedButton({
    Key key,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  _AsyncRaisedButtonState createState() => _AsyncRaisedButtonState();
}

class _AsyncRaisedButtonState extends State<AsyncRaisedButton> {
  bool _isLoading = false;

  void animateButton() async {
    setState(() {
      _isLoading = true;
    });

    await widget.onPressed();

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget setUpButtonChild() {
    if (_isLoading == false) {
      return widget.text;
    }
    return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(strokeWidth: 3));
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: setUpButtonChild(),
      onPressed: _isLoading ? null : animateButton,
    );
  }
}
