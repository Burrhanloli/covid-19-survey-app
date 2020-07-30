import 'package:auto_route/auto_route.dart';
import 'package:covid19_survey_app/blocs/graphql/add_result_cubit.dart';
import 'package:covid19_survey_app/blocs/graphql/bloc/graphql_state.dart';
import 'package:covid19_survey_app/graphql/add_result/add_result_mutation.dart';
import 'package:covid19_survey_app/presentation/core/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: maxHeight * 0.4),
              BlocBuilder<AddResultCubit, GraphqlState>(
                builder: (BuildContext context, GraphqlState<dynamic> state) {
                  Widget child = const Center(
                    child: CircularProgressIndicator(),
                  );
                  if (state is GraphqlError) {
                    child = Center(
                      child:
                          Text(state.result.exception.graphqlErrors.toString()),
                    );
                  }
                  if (state is GraphqlLoaded<RootMutation$RootMutation>) {
                    final RootMutation$RootMutation$Result result =
                        state.data.addResult;
                    child = Column(
                      children: <Widget>[
                        if (result.is_high_risk)
                          const Text(
                              "You are at High Risk, Please Share your contact details",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold)),
                        if (!result.is_high_risk) ...[
                          const Text("Hurray! you are not at High Risk",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold)),
                        ],
                        SizedBox(height: maxHeight * 0.3),
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
    );
  }
}
