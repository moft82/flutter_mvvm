import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/viewmodel/form_viewmodel.dart';
import 'package:provider/provider.dart';

class InputView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final FormViewModel formViewModel = Provider.of<FormViewModel>(context);
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// Basic TextFormField
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (val) {},
                onSaved: (val) {},
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Enter Name";
                  }
                  return null;
                },
              ),

              /// TextFormField for Password
              TextFormField(
                obscureText: true,

                /// Setting for Password
                decoration: const InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (val) {},
                onSaved: (val) {},
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
              ),

              /// TextFormField for email
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: (val) {},
                onSaved: (val) {},
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Enter E-mail";
                  }
                  if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(val)) {
                    return 'Wrong Email Format';
                  }
                  return null;
                },
              ),

              Checkbox(
                  value: formViewModel.checked,
                  onChanged: (val) {
                    formViewModel.setChecked = val ?? false;
                  },
              ),

              CupertinoSwitch(
                value: formViewModel.switchChecked,
                activeColor: CupertinoColors.activeBlue,
                onChanged: (val) {
                  formViewModel.setSwitchChecked = val ?? false;
                },

              ),
              DropdownButton<String>(
                value: formViewModel.dropdownVal,
                onChanged: (val) {
                  formViewModel.setDropdownVal = val ?? formViewModel.dropdownVal;
                },
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Slider(
                value: formViewModel.sliderVal,
                onChanged: (val) {
                  formViewModel.setSliderVal = val;
                },
                min: 0,
                max: 100,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // formViewModel.saveUserData();
                      }
                    },
                    child: Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                      // formViewModel.resetForm();
                    },
                    child: Text('Reset'),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
