import 'package:flutter/material.dart';

//Styles
import 'package:Recipes_app/src/styles/styles.dart';

//Widgets
import 'package:Recipes_app/src/widgets/appBars.dart';
import 'package:Recipes_app/src/widgets/bottomNavigation.dart';
import '../userManagement/auth.dart';
import '../widgets/buttons.dart';
import '../widgets/drawerMenu.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
   Future<void> signOut() async{
     await Auth().signOut();
     Navigator.pushNamed(context, '/');
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: colorBG,
        body: CustomScrollView(
          slivers: <Widget>[
            appBar(context, 'My profile'),
            SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children:<Widget>[
                      Text("User"),
                      BasicButton(
                        onPressed: () {
                          signOut();
                        },
                        text: 'Log out',
                      ),
                    ],
                  )
                ]))
          ],
        ),
        bottomNavigationBar: bottomNavigation(context)
    );
  }
}
