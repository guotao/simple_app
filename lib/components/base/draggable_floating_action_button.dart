import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DragAbleFloatingActionButton extends StatefulWidget {
  //子控件
  Widget child;
  DragAbleFloatingActionButton({Key? key, required this.child})
      : super(key: key);

  @override
  State<DragAbleFloatingActionButton> createState() =>
      _DragAbleFloatingActionButtonState();
}

class _DragAbleFloatingActionButtonState
    extends State<DragAbleFloatingActionButton> {
  Offset position = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    if (position.dx == 0 && position.dx == 0) {
      position = Offset(MediaQuery.of(context).size.width - 60,
          MediaQuery.of(context).size.height - 60);
    }
    return Stack(
      children: [
        Positioned(
            top: position.dy,
            left: position.dx,
            child: Draggable(
                feedback: widget.child,
                child: widget.child,
                childWhenDragging: Container(),
                onDragEnd: (details) {
                  setState(() {
                    position = details.offset;
                  });
                }))
      ],
    );
  }
}
