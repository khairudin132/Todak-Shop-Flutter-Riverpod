import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todak_shop/core/core.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({
    super.key,
    required this.text,
    this.trimLength = 100,
  });

  final String text;
  final int trimLength;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool expanded = false;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > widget.trimLength) {
      firstHalf = widget.text.substring(0, widget.trimLength);
      secondHalf = widget.text.substring(widget.trimLength);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _toggleExpanded;
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: expanded
                ? (firstHalf + secondHalf)
                : (secondHalf.isEmpty ? firstHalf : '$firstHalf...'),
            style: context.textTheme.bodyMedium,
          ),
          if (secondHalf.isNotEmpty)
            TextSpan(
              text: expanded ? ' Read less' : ' Read more',
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.blue,
              ),
              recognizer: _tapGestureRecognizer,
            ),
        ],
      ),
    );
  }
}
