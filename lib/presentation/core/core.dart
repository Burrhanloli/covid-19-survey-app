import 'package:flutter/material.dart';

AppBar buildAppBar(
    {@required String title,
    @required BuildContext context,
    List<Widget> actions}) {
  return AppBar(
    actionsIconTheme: Theme.of(context)
        .iconTheme
        .copyWith(color: Theme.of(context).primaryColor),
    iconTheme: Theme.of(context)
        .iconTheme
        .copyWith(color: Theme.of(context).primaryColor),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
    centerTitle: true,
    actions: actions ?? [],
    title: Text(
      title,
      style: TextStyle(
          color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),
    ),
  );
}
