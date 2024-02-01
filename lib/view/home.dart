import 'package:flutter/material.dart';
import 'package:flutter_mvvm/config/enum.dart';
import 'package:flutter_mvvm/view/input.dart';
import '../core/toast.dart';
import '../core/dialog.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget spacer(){
    return const SizedBox(height: 10);
  }

  Widget toastTester(BuildContext context) {
    Toast toast = Toast();
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      ElevatedButton(
          onPressed: () {
            toast.showToast(
                context: context,
                contents: "primary",
                toastType: ToastType.primary);
          },
          child: const Text("primary")),
      ElevatedButton(
          onPressed: () {
            toast.showToast(
                context: context,
                contents: "error",
                toastType: ToastType.error);
          },
          child: const Text("error")),
      ElevatedButton(
          onPressed: () {
            toast.showToast(
                context: context,
                contents: "warning",
                toastType: ToastType.warning);
          },
          child: const Text("warning")),
      ElevatedButton(
          onPressed: () {
            toast.showToast(
                context: context,
                contents: "success",
                toastType: ToastType.success);
          },
          child: const Text("success")),
    ]);
  }

  Widget dialogTester(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
      ElevatedButton(
          onPressed: () {
            showCustomDialog(context: context,
                dialog: alertDialog(context: context,
                    title: "Alert Dialog",
                    content: "Alert Dialog"));
          },
          child: const Text("alert")),
      ElevatedButton(
          onPressed: () {
            showCustomDialog(context: context,
                dialog: simpleDialog(
                  context: context,
                  title: "Simple Dialog",
                  content: "Simple Dialog",
                  confirmKeyword: "Confirm",
                  confirmOnTap: () {
                    Navigator.pop(context);
                  },
                  dismissKeyword: "Discard",
                  dismissOnTap: () {
                    Navigator.pop(context);
                  },
                ));
          },
          child: const Text("simple")),
      ElevatedButton(
          onPressed: () async {
            var date = await datePickerDialog(context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now());
          },
          child: const Text("Date")),
      ElevatedButton(
          onPressed: () async {
            var date = await dateRangePickerDialog(context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now());
          },
          child: const Text("Date Range")),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Toast"),
              toastTester(context),
              spacer(),
              const Text("Dialog"),
              dialogTester(context),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> InputView()));
                  },
                  child: const Text("alert"))
            ],
          )),);
  }
}
