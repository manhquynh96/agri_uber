import 'package:agri_uber/widget/list_order_list.dart';
import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  final double width;
  final EdgeInsets padding;
  final double punchRadius;
  final double borderRadius;
  final Widget top;
  final Widget bottom;
  final Color color;
  final bool isCornerRounded;

  const Ticket({
    Key key,
    @required this.width,
    @required this.punchRadius,
    @required this.borderRadius,
    @required this.top,
    @required this.bottom,
    this.color = Colors.white,
    this.isCornerRounded = false,
    this.padding = const EdgeInsets.all(5.0),
  }) : super(key: key);
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.03),
            blurRadius: 20,
            offset: Offset(0.0, 0.0),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 20,
            offset: Offset(0.0, 10.0),
            spreadRadius: -15,
          ),
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipPath(
              clipper: TicketClipper(widget.punchRadius),
              child: Column(
                children: [
                  Container(
                    width: widget.width,
                    child: widget.top,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                  ),
                  SizedBox(
                    width: widget.width,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      color: Colors.white,
                      child: Dash(
                        width: 6,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: TicketClipperBottom(widget.punchRadius),
              child: Container(
                width: widget.width,
                child: widget.bottom,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  double punchRadius;
  TicketClipper(this.punchRadius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height), radius: punchRadius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height), radius: punchRadius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TicketClipperBottom extends CustomClipper<Path> {
  double punchRadius;
  TicketClipperBottom(this.punchRadius);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: Offset(0.0, 0), radius: punchRadius));
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 0), radius: punchRadius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Dash extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const Dash(
      {Key key, this.width = 3, this.height = 1, this.color = Colors.black})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
