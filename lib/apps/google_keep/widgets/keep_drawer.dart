import 'package:flutter/material.dart';

class DrawerItem {
  String? name;
  IconData? icon;
  bool? selected;

  DrawerItem({this.name, this.icon, this.selected = false});
}

List<DrawerItem> drawerList = [
  DrawerItem(
      icon: Icons.lightbulb_outline_rounded, name: "Notes", selected: true),
  DrawerItem(
      icon: Icons.notifications_rounded, name: "Reminder", selected: false),
  DrawerItem(icon: Icons.add, name: "Create new label", selected: false),
  DrawerItem(icon: Icons.archive, name: "Archive", selected: false),
  DrawerItem(icon: Icons.delete, name: "Deleted", selected: false),
  DrawerItem(icon: Icons.settings, name: "Settings", selected: false),
  DrawerItem(icon: Icons.help, name: "Help & Feedback", selected: false),
];

class KeepDrawer extends StatefulWidget {
  KeepDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<KeepDrawer> createState() => _KeepDrawerState();
}

class _KeepDrawerState extends State<KeepDrawer> {
  final drawerItems = drawerList;

  handleClick(int index) {
    for (var item = 0; item < drawerItems.length; item++) {
      if (item == index) {
        drawerItems[item].selected = true;
      } else {
        drawerItems[item].selected = false;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FlutterLogo(size: 60),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: drawerItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final isSelected = drawerItems[index].selected!;
                      return GestureDetector(
                        onTap: () => {handleClick(index)},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: isSelected
                                ? const BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50),
                                    ),
                                  )
                                : const BoxDecoration(),
                            child: Row(
                              children: [
                                Icon(drawerItems[index].icon),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(drawerItems[index].name!),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
