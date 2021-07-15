import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_huanhu/conpontent/ui/toast.dart';

import 'color_utils.dart';
import 'icon.dart';

// ignore: must_be_immutable
class XComputer extends StatefulWidget {
  int min;
  int max;
  final double height;
  int num;
  final ValueChanged<int> onValueChanged;

  XComputer({Key? key, this.height = 36.0, this.num = 0, this.min = 0, this.max = 1000000000000, required this.onValueChanged}) : super(key: key);

  @override
  _XComputerState createState() {
    return _XComputerState();
  }
}

class _XComputerState extends State<XComputer> {
  int get min => widget.min;
  int get max => widget.max;
  int get num => widget.num;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(2.0)),
      //   border: Border.all(color: Colors.grey, width: 0.5),
      // ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: _minusNum,
            child: Container(
              width: 20.0,
              alignment: Alignment.center,
              child: IconRemove(num == min),
            ),
          ),
          // Container(
          //   width: 0.5,
          //   color: Colors.grey,
          // ),
          Container(
            width: 40.0,
            alignment: Alignment.center,
            child: Text(
              widget.num.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 16.0, color: HexToColor('#3E3E3E')),
            ),
          ),
          // Container(
          //   width: 0.5,
          //   color: Colors.grey,
          // ),
          GestureDetector(
            onTap: _addNum,
            child: Container(
              width: 20.0,
              alignment: Alignment.center,
              child: IconAdd(num == max),
            ),
          ),
        ],
      ),
    );
  }

  void _minusNum() {
    if (widget.num == min) {
      showToast('不可小于最小数量');
      return;
    }

    setState(() {
      widget.num -= 1;

      if (widget.onValueChanged != null) {
        widget.onValueChanged(widget.num);
      }
    });
  }

  void _addNum() {
    if (widget.num == max) {
      showToast('不可大于最大数量');
      return;
    }
    setState(() {
      widget.num += 1;
      if (widget.onValueChanged != null) {
        widget.onValueChanged(widget.num);
      }
    });
  }
}