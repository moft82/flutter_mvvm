import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import '../config/app_color.dart';
import '../config/app_font.dart';
import '../config/enum.dart';

Future<dynamic> showCustomDialog(
    {required BuildContext context, required Widget dialog}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      });
}

/// Container Widget for dialog to maintain style
Widget dialogBox({required Widget child}) {
  return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(26.0.r)),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.w),
          child: child));
}

/// Widget for dialog column to maintain style
Widget dialogColumn({required List<Widget> children}) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children);
}

/// Widget for dialog title
Widget dialogTitle(String contents) {
  return Text(style: TextStyles.Heading1, contents);
}

/// Widget for dialog contents
Widget dialogContents(String contents) {
  return Text(style: TextStyles.NormalText_M, contents);
}

/// Widget for making space between content and bottomRow
Widget bottomRowSpacer() {
  return const SizedBox(height: 30);
}

/// Widget for dialog bottom row containing buttons such as yes and no
Widget bottomRow({required List<Widget> children}) {
  return Row(mainAxisAlignment: MainAxisAlignment.end, children: children);
}

/// Widget for building dialog bottom row button
/// Check button string and void call back is both available
/// If button is available, add buttons and return buttons.
List<Widget> bottomRowChildrenBuilder(
    {required String? confirmKeyword,
    required VoidCallback? confirmOnTap,
    required String? dismissKeyword,
    required VoidCallback? dismissOnTap}) {
  Common common = Common();
  Logger logger = Logger();

  if(confirmKeyword == null){
    assert(confirmOnTap == null,
    common.assertMessage(
        widgetName: "bottomRowChildrenBuilder",
        message:
        "If confirmKeyword is null, confirmOnTap must be null"));
  }
  else{
    assert(confirmOnTap != null,
    common.assertMessage(
        widgetName: "bottomRowChildrenBuilder",
        message:
        "If confirmKeyword is not null, confirmOnTap must not be null"));
  }

  if(dismissKeyword == null){
    assert(dismissOnTap == null,
    common.assertMessage(
        widgetName: "bottomRowChildrenBuilder",
        message:
        "If dismissKeyword is null, dismissOnTap must be null"));
  }
  else{
    assert(dismissOnTap != null,
    common.assertMessage(
        widgetName: "bottomRowChildrenBuilder",
        message:
        "If dismissKeyword is not null, dismissOnTap must not be null"));
  }

  List<Widget> bottomRowChildren = [];

  if (
  confirmKeyword != null && confirmOnTap != null) {
    bottomRowChildren.add(confirmButton(confirmKeyword, onTap: confirmOnTap));
  }
  if (dismissKeyword != null && dismissOnTap != null) {
    if(bottomRowChildren.isNotEmpty){
      bottomRowChildren.add(const SizedBox(width: 10,));
    }
    bottomRowChildren.add(dismissButton(dismissKeyword, onTap: dismissOnTap));
  }

  return bottomRowChildren;
}

Widget confirmButton(String contents, {required VoidCallback onTap}) {
  return InkWell(
      onTap: onTap, child: Text(style: TextStyles.smallTextR, contents));
}

Widget dismissButton(String contents, {required VoidCallback onTap}) {
  return InkWell(
      onTap: onTap, child: Text(style: TextStyles.smallTextR, contents));
}

Widget alertDialog(
    {required BuildContext context,
    required String title,
    required String content}) {
  return dialogBox(
      child: dialogColumn(children: [
    dialogTitle(title),
    dialogContents(content),
    bottomRowSpacer(),
    bottomRow(children: [
      confirmButton("OK", onTap: () {
        Navigator.pop(context);
      }),
    ])
  ]));
}

Widget simpleDialog({
  required BuildContext context,
  required String title,
  required String content,
  String? confirmKeyword,
  String? dismissKeyword,
  VoidCallback? confirmOnTap,
  VoidCallback? dismissOnTap,
}) {
  return dialogBox(
      child: dialogColumn(children: [
    dialogTitle(title),
    dialogContents(content),
    bottomRow(
        children: bottomRowChildrenBuilder(
            confirmKeyword: confirmKeyword,
            confirmOnTap: confirmOnTap,
            dismissKeyword: dismissKeyword,
            dismissOnTap: dismissOnTap))
  ]));
}

Widget buildRadioListView(
    {required List<Option> items, required String groupValue}) {
  return ListView.builder(
    physics: const ClampingScrollPhysics(),
    shrinkWrap: true,
    itemCount: items.length,
    itemBuilder: (context, int idx) {
      Option item = items[idx];

      return RadioListTile(
        onChanged: (value) {},
        groupValue: groupValue,
        value: item.name,
        title: Text(item.name),
      );
    },
  );
}

Widget radioDialog(String? confirmKeyword, VoidCallback? confirmOnTap,
    String? dismissKeyword, VoidCallback? dismissOnTap,
    {required BuildContext context,
    required String title,
    required List<Option> options,
    required String groupValue}) {
  Common common = Common();

  return dialogBox(
      child: dialogColumn(children: [
    dialogTitle(title),
    buildRadioListView(items: common.optionList(), groupValue: groupValue),
    bottomRow(
        children: bottomRowChildrenBuilder(
            confirmKeyword: confirmKeyword,
            confirmOnTap: confirmOnTap,
            dismissKeyword: dismissKeyword,
            dismissOnTap: dismissOnTap))
  ]));
}

Future<DateTime?> datePickerDialog({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) async {
  return await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );
}

Future<DateTimeRange?> dateRangePickerDialog({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) async {
  return await showDateRangePicker(
    context: context,
    firstDate: firstDate,
    lastDate: lastDate,
  );
}
