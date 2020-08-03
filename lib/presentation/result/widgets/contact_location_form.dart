import 'package:covid19_survey_app/blocs/graphql/add_contact_location.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactLocationForm extends StatelessWidget {
  ContactLocationForm({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                maxLength: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey[200])),
                  filled: true,
                  fillColor: Colors.grey[100],
                  labelText: "Mobile Number",
                ),
                controller: _phoneController,
                textInputAction: TextInputAction.next,
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
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey[200])),
                  filled: true,
                  fillColor: Colors.grey[100],
                  labelText: "Location/Address",
                ),
                controller: _locationController,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
                onFieldSubmitted: (value) => submitContactLocation(context),
              ),
              SizedBox(
                height: maxHeight * 0.04,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  onPressed: () => submitContactLocation(context),
                  color: Colors.blue,
                  child: const Text("Submit Info"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void submitContactLocation(BuildContext context) {
    FocusManager.instance.primaryFocus.unfocus();
    if (_formKey.currentState.validate()) {
      final phone = _phoneController.text.trim();
      final location = _locationController.text.trim();
      context
          .bloc<AddContactLocationCubit>()
          .runQueryWithValues(phone, location);

      FlushbarHelper.createLoading(
              message: "Adding location", linearProgressIndicator: null)
          .show(context);
    }
  }
}
