import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

//Widgets
import '../widgets/appBars.dart';

class CreateRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBG,
        body: CustomScrollView(
          slivers: <Widget>[
            appBarOnlyTitle('Add Recipe'),
            SliverList(delegate: SliverChildListDelegate([Column()]))
          ],
        ));
  }
}
