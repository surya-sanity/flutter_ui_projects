import 'package:flutter/material.dart';
import 'package:flutter_ui_projects/apps/google_keep/keep.dart';

class AppList {
  late Widget? app;
  late String? appName;
  AppList({this.app, this.appName});
}

List<AppList> appList = [AppList(app: const Keep(), appName: "Google keep")];

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, __, ___) => const Keep(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  ),
                  title: Text("${appList[index].appName}"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
