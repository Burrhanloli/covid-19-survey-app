import 'package:covid19_survey_app/blocs/auth/auth_cubit.dart';
import 'package:covid19_survey_app/presentation/core/core.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppBar(title: "login", context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            autovalidate: true,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: maxHeight * 0.2,
                ),
                TextFormField(
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[200])),
                    filled: true,
                    fillColor: Colors.grey[100],
                    labelText: "Mobile Number",
                  ),
                  onFieldSubmitted: (value) => submitPhoneNumber(context),
                  controller: _phoneController,
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter mobile number';
                    }
                    if (value.length == 10) {
                      return null;
                    }
                    return "Please enter a valid mobile number";
                  },
                ),
                SizedBox(
                  height: maxHeight * 0.1,
                ),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                    onPressed: () => submitPhoneNumber(context),
                    color: Colors.blue,
                    child: const Text("LOGIN"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitPhoneNumber(BuildContext context) {
    FocusManager.instance.primaryFocus.unfocus();
    if (_formKey.currentState.validate()) {
      final phone = _phoneController.text.trim();
      context.bloc<AuthCubit>().login(phone, context);

      FlushbarHelper.createLoading(
          message: "Logging in", linearProgressIndicator: null);
    }
  }
}
