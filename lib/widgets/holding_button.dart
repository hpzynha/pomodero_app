import 'package:flutter/material.dart';

class HoldingButton extends StatefulWidget {
  final String buttonText;
  final Duration holdDuration;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color loadingColor;
  final Widget loadingIndicator;
  final Widget completeIndicator;

  const HoldingButton({
    super.key,
    required this.buttonText,
    required this.holdDuration,
    required this.onPressed,
    this.buttonColor = Colors.blue,
    this.loadingColor = Colors.grey,
    required this.loadingIndicator,
    required this.completeIndicator,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HoldingButtonState createState() => _HoldingButtonState();
}

class _HoldingButtonState extends State<HoldingButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isHolding = false;
  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.holdDuration,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isComplete = true;
        });
        widget.onPressed();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleHoldStart() {
    setState(() {
      _isHolding = true;
    });
    _animationController.forward();
  }

  void _handleHoldEnd() {
    setState(() {
      _isHolding = false;
      _isComplete = false;
    });
    _animationController.stop();
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _handleHoldStart(),
      onTapUp: (_) => _handleHoldEnd(),
      onTapCancel: () => _handleHoldEnd(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: _isComplete
                ? widget.completeIndicator
                : _isHolding
                    ? widget.loadingIndicator
                    : Text(
                        widget.buttonText,
                        style: const TextStyle(color: Colors.white),
                      ),
          ),
        ],
      ),
    );
  }
}
