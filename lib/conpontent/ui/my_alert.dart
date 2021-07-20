import 'package:flutter/cupertino.dart';

class ShowInputAlertWidget extends StatefulWidget {
  final callback;
  final title;
  final placeholder;
  const ShowInputAlertWidget(this.callback, this.title, this.placeholder);

  @override
  _ShowInputAlertWidgetState createState() => _ShowInputAlertWidgetState();
}

class _ShowInputAlertWidgetState extends State<ShowInputAlertWidget> {
  String inputValue = '';

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(widget.title),
      content: Column(
        children: <Widget>[
          CupertinoTextField(
            placeholder: widget.placeholder,
            onChanged: (value) {
              inputValue = value;
            },
          )
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("取消"),
          onPressed: () {
            Navigator.pop(context);
            widget.callback(null);
          },
        ),
        CupertinoDialogAction(
          child: Text("确定"),
          onPressed: () {
            widget.callback(inputValue);

            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class ShowTipsAlterWidget extends StatefulWidget {
  final callback;

  final title;

  final info;

  const ShowTipsAlterWidget(this.callback, this.title, this.info);

  @override
  _ShowTipsAlterWidgetState createState() => _ShowTipsAlterWidgetState();
}

class _ShowTipsAlterWidgetState extends State<ShowTipsAlterWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: widget.title == null ? null : Text(widget.title),
      content: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Align(
            child: Text(widget.info),
            alignment: Alignment(0, 0),
          ),
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("取消"),
          onPressed: () {
            Navigator.pop(context);
            widget.callback(false);
          },
        ),
        CupertinoDialogAction(
          child: Text("确定"),
          onPressed: () {
            widget.callback(true);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class ShowCustomAlterWidget extends StatefulWidget {
  final confirmCallback;
  final list;
  final title;

  const ShowCustomAlterWidget(this.confirmCallback, this.list, this.title);

  @override
  _ShowCustomAlterWidgetState createState() => _ShowCustomAlterWidgetState();
}

class _ShowCustomAlterWidgetState extends State<ShowCustomAlterWidget> {
  final controller = TextEditingController();

  String inputValuue = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: widget.title == null ? null : Text(widget.title),
      actions: List.generate(
        widget.list.length,
        (index) => CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            widget.confirmCallback(index);
          },
          child: Text(widget.list[index]),
        ),
      ),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('取消'),
      ),
    );
  }
}
