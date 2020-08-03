import 'package:auto_route/auto_route.dart';
import 'package:covid19_survey_app/blocs/graphql/add_contact_location.dart';
import 'package:covid19_survey_app/blocs/graphql/add_result_cubit.dart';
import 'package:covid19_survey_app/blocs/graphql/bloc/graphql_state.dart';
import 'package:covid19_survey_app/blocs/graphql/graphql_utils.dart';
import 'package:covid19_survey_app/graphql/add_result/add_result_mutation.dart';
import 'package:covid19_survey_app/presentation/core/router.gr.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return BlocProvider<AddContactLocationCubit>(
      create: (BuildContext context) =>
          AddContactLocationCubit(client: getClient()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SizedBox(height: maxHeight * 0.1),
                BlocBuilder<AddResultCubit, GraphqlState>(
                  builder:
                      (BuildContext context, GraphqlState<dynamic> state) {
                    Widget child = const Center(
                      child: CircularProgressIndicator(),
                    );
                    if (state is GraphqlError) {
                      child = Center(
                        child: Text(
                            state.result.exception.graphqlErrors.toString()),
                      );
                    }
                    if (state is GraphqlLoaded<RootMutation$RootMutation>) {
                      final RootMutation$RootMutation$Result result =
                          state.data.addResult;
                      child = Column(
                        children: <Widget>[
                          if (result.is_high_risk) ...[
                            const Text(
                                "You are at High Risk, Please Share your contact details",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: maxHeight * 0.04,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    maxLength: 10,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(8)),
                                          borderSide: BorderSide(
                                              color: Colors.grey[200])),
                                      filled: true,
                                      fillColor: Colors.grey[100],
                                      labelText: "Mobile Number",
                                    ),
                                    controller: _phoneController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter
                                          .digitsOnly
                                    ],
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
                                          borderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(8)),
                                          borderSide: BorderSide(
                                              color: Colors.grey[200])),
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
                                    onFieldSubmitted: (value) =>
                                        submitContactLocation(context),
                                  ),
                                  SizedBox(
                                    height: maxHeight * 0.04,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: FlatButton(
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(16),
                                      onPressed: () =>
                                          submitContactLocation(context),
                                      color: Colors.blue,
                                      child: const Text("Submit Info"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: maxHeight * 0.04,
                            ),
                            BlocBuilder<AddContactLocationCubit,
                                GraphqlState>(
                              builder: (BuildContext context,
                                  GraphqlState<dynamic> state) {
                                Widget child = Container();
                                if (state is GraphqlLoading) {
                                  child = const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state is GraphqlError) {
                                  child = Center(
                                    child: Text(state
                                        .result.exception.graphqlErrors
                                        .toString()),
                                  );
                                }
                                if (state is GraphqlLoaded) {
                                  child = const Center(
                                    child: Text("Loaded!"),
                                  );
                                }
                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: child,
                                );
                              },
                            )
                          ],
                          if (!result.is_high_risk)
                            const Text("Hurray! you are not at High Risk",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold)),
                          SizedBox(height: maxHeight * 0.2),
                          Container(
                            width: double.infinity,
                            child: FlatButton(
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(16),
                              onPressed: () => ExtendedNavigator.of(context)
                                  .popUntilPath(Routes.homePage),
                              color: Theme.of(context).primaryColor,
                              child: const Text("Go Back"),
                            ),
                          )
                        ],
                      );
                    }
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: child,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
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
