import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/core/widgets/app_text_field.dart';
import 'package:openex_mobile/core/widgets/positive_button.dart';
import 'package:openex_mobile/utils/log/log.dart';
import 'package:openex_mobile/utils/utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameTC = TextEditingController();
  final _passwordTC = TextEditingController();
  final FocusNode _usernameFN = FocusNode();
  final FocusNode _passwordFN = FocusNode();

  final _fieldErrors = <String, String>{};

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextField(
              title: 'username',
              controller: _usernameTC,
              validator: Validators.required,
              errorText: _fieldErrors['username'],
              inputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onEditingComplete: () => _usernameFN.requestFocus(),
            ),
            SizedBox(
              height: 20.sp,
            ),
            AppTextField(
              title: 'password',
              controller: _passwordTC,
              validator: Validators.required,
              errorText: _fieldErrors['password'],
              inputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              onEditingComplete: () => _usernameFN.requestFocus(),
            ),
            SizedBox(
              height: 20.sp,
            ),
            PositiveButton(height: 42.h, title: 'login', onPressed: _onSubmit),
          ],
        ));
  }

  _onSubmit() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      Log.d("login:${_usernameTC.text} ${_passwordTC.text}");
    }
  }
}
