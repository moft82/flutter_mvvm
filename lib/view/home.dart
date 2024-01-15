import 'package:flutter/material.dart';
import 'package:flutter_mvvm/config/enum.dart';

import '../core/toast.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget toastTester(BuildContext context) {
    Toast toast = Toast();
    return Row(children: [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text("Toast"),
          toastTester(context),
          ],
        )),);
  }
}
