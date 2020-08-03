import 'package:covid19_survey_app/blocs/graphql/bloc/graphql_state.dart';
import 'package:covid19_survey_app/blocs/graphql/get_results_cubit.dart';
import 'package:covid19_survey_app/graphql/get_results/get_results_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<GetResultsCubit, GraphqlState>(
      builder: (context, state) {
        Widget child = const Center(
          child: CircularProgressIndicator(),
        );
        if (state is GraphqlError) {
          child = Center(
            child: Text(state.result.exception.graphqlErrors.toString()),
          );
        }
        if (state is GraphqlLoaded<RootQuery$RootQuery>) {
          final results = state.data.getResultsForUser;
          if (results.isEmpty) {
            child = const Center(
              child: Text("No Results avialaible"),
            );
          } else {
            child = Container(
              height: maxHeight * 0.7,
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    key: ValueKey(results[index].id),
                    // onTap: (),
                    title: results[index].is_high_risk
                        ? Text("You are at High Risk",
                            style: TextStyle(color: Colors.red))
                        : Text("You are NOT at High Risk",
                            style: TextStyle(color: Colors.green)),
                    subtitle: Text(results[index].date),
                  );
                },
              ),
            );
          }
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: child,
        );
      },
    );
  }
}
