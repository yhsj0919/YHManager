import 'dart:ui';

import 'package:flutter/material.dart';

class BlurWidget extends StatefulWidget {
  Widget child;
  double padding;
  double margin;
  double width;
  double height;
  double radius;
  Color color;
  double elevation;
  Alignment alignment;
  double blur;
  Color shadowColor;
  Color splashColor;
  ShapeBorder shape;
  GestureTapCallback onTap;
  double borderWidth;
  BoxBorder border;

  BlurWidget(
      {this.child,
      this.width,
      this.blur: 10,
      this.height,
      this.margin: 0,
      this.padding: 0,
      this.elevation: 4,
      this.shadowColor,
      this.splashColor: Colors.white,
      this.radius: 0,
      this.alignment,
      this.shape,
      this.borderWidth: 0,
      this.color: Colors.white54,
      this.border,
      this.onTap});

  @override
  _BlurWidgetState createState() => _BlurWidgetState();
}

class _BlurWidgetState extends State<BlurWidget> {
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: widget.border == null ? BorderRadius.all(Radius.circular(widget.radius)) : null,
        border: widget.border ?? Border.all(color: widget.borderWidth == 0 ? Colors.transparent : Color(0xffcccccc), width: widget.borderWidth),
        boxShadow: [
          BoxShadow(
              color: widget.shadowColor ?? Colors.black12,
              offset: widget.elevation > 0 ? Offset(2, 4) : Offset.zero, //阴影xy轴偏移量
              blurRadius: widget.elevation * 2, //阴影模糊程度
              spreadRadius: widget.elevation //阴影扩散程度
              ),
        ],
      ),
      margin: EdgeInsets.all(widget.margin),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.blur,
            sigmaY: widget.blur,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              focusNode: focusNode,
              splashColor: widget.shadowColor ?? widget.splashColor,
              focusColor: widget.shadowColor?.withAlpha(55),
              onHover: (hover) {
                setState(() {
                  hover ? focusNode.requestFocus() : focusNode.unfocus();
                });
              },
              onTap: widget.onTap,
              child: Container(
                alignment: widget.alignment,
                width: widget.width,
                height: widget.height,
                color: widget.color,
                padding: EdgeInsets.all(widget.padding),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// // ignore: must_be_immutable
// class BlurWidget extends StatelessWidget {
//   Widget child;
//   double padding;
//   double margin;
//   double width;
//   double height;
//   double radius;
//   Color color;
//   double elevation;
//   Alignment alignment;
//   double blur;
//   Color shadowColor;
//   ShapeBorder shape;
//   GestureTapCallback onTap;
//   double borderWidth;
//
//   BlurWidget(
//       {this.child,
//       this.width,
//       this.blur: 20,
//       this.height,
//       this.margin: 0,
//       this.padding: 0,
//       this.elevation: 4,
//       this.shadowColor,
//       this.radius: 0,
//       this.alignment,
//       this.shape,
//       this.borderWidth: 0,
//       this.color: Colors.white38,
//       this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(radius)),
//         border: Border.all(color: borderWidth == 0 ? Colors.transparent : Color(0xffcccccc), width: borderWidth),
//         boxShadow: elevation > 0
//             ? [
//                 BoxShadow(
//                     color: shadowColor ?? Colors.black12,
//                     offset: Offset(0.0, elevation), //阴影xy轴偏移量
//                     blurRadius: elevation * 2, //阴影模糊程度
//                     spreadRadius: elevation //阴影扩散程度
//                     ),
//               ]
//             : null,
//       ),
//       margin: EdgeInsets.all(margin),
//       child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(radius)),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(
//             sigmaX: blur,
//             sigmaY: blur,
//           ),
//           child: Listener(
//             onPointerHover: (point) {},
//             child: Container(
//               alignment: alignment,
//               width: width,
//               height: height,
//               color: color,
//               padding: EdgeInsets.all(padding),
//               child: child,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
