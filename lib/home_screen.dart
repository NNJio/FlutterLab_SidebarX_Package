import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({
    Key? key,
    required this.route,
    required this.body,
  }) : super(key: key);

  final Widget body;
  final String route;

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  final List<AdminMenuItem> _sideBarItems = const [
    AdminMenuItem(
      title: 'User',
      route: '/',
      icon: Icons.person_outline_outlined,
    ),
    AdminMenuItem(
      title: 'Company',
      route: '',
      icon: Icons.person_outline_outlined,
    ),
    AdminMenuItem(
      title: 'Application',
      route: '/',
      icon: Icons.person_outline_outlined,
    ),
    AdminMenuItem(
      title: 'Top Level',
      icon: Icons.file_copy,
      children: [
        AdminMenuItem(
          title: 'Second Level Item 1',
          route: '/secondLevelItem1',
        ),
        AdminMenuItem(
          title: 'Second Level Item 2',
          route: '/secondLevelItem2',
        ),
        AdminMenuItem(
          title: 'Third Level',
          children: [
            AdminMenuItem(
              title: 'Third Level Item 1',
              route: '/thirdLevelItem1',
            ),
            AdminMenuItem(
              title: 'Third Level Item 2',
              route: '/thirdLevelItem2',
              icon: Icons.image,
            ),
          ],
        ),
      ],
    ),
  ];

  final List<AdminMenuItem> _adminMenuItems = const [
    AdminMenuItem(
      title: 'User Profile',
      icon: Icons.account_circle,
      route: '/',
    ),
    AdminMenuItem(
      title: 'Settings',
      icon: Icons.settings,
      route: '/',
    ),
    AdminMenuItem(
      title: 'Logout',
      icon: Icons.logout,
      route: '/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sample'),
        actions: [
          PopupMenuButton<AdminMenuItem>(
            child: const Icon(Icons.account_circle),
            itemBuilder: (context) {
              return _adminMenuItems.map((AdminMenuItem item) {
                return PopupMenuItem<AdminMenuItem>(
                  value: item,
                  child: Row(
                    children: [
                      Icon(item.icon),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: (item) {
              print(
                  'actions: onSelected(): title = ${item.title}, route = ${item.route}');
              Navigator.of(context).pushNamed(item.route!);
            },
          ),
        ],
      ),
      sideBar: SideBar(
        backgroundColor:  Colors.white,
        activeBackgroundColor: Colors.amber,
        // borderColor: const Color(0xFFE7E7E7),
        iconColor: Colors.black,
        activeIconColor: Colors.black,
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
        activeTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
        //! Topic in sidebar
        items: _sideBarItems,
        selectedRoute: widget.route,
        onSelected: (item) {
          print(
              'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
          if (item.route != null && item.route != widget.route) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
        //! Topic in sidebar

        // header: Container(
        //   height: 50,
        //   width: double.infinity,
        //   color: const Color(0xff444444),
        //   child: const Center(
        //     child: Text(
        //       'header',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        footer: Container(
          height: 70,
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'data:image/jpeg;base64,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'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 39, 0),
                            child: Text(
                              'Fintechinno',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text('jordi@pornmail.com'),
                        ],
                      ),
                      const Spacer(),
                      MaterialButton(
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const LoginScreen()));
                        },
                        child: const Icon(Icons.logout_rounded),
                      ),
                    ],
                  ),
                ),
        ),
      ),
      body: SingleChildScrollView(
        child: widget.body,
      ),
    );
  }
}
