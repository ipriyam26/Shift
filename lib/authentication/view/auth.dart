import 'package:flutter/material.dart';

import '../../home/views/homeView.dart';
import '../../user/views/user.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          const HomeView(),
          UserScreen(),
        ],
      ));

  }
}
