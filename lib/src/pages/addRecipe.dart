import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

//Widgets
import '../widgets/alerts.dart';
import '../widgets/appBars.dart';
import '../widgets/textInputs.dart';

//External Packages
import 'package:duration_picker/duration_picker.dart';

class AddRecipe extends StatefulWidget {
  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final _formKey = GlobalKey<FormState>();
  Duration _duration = Duration.zero;
  String? dif = "Difficulty", servings = "Servings";
  int durationF = 0;
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  TextEditingController controllerPreparation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTime =
        TextEditingController(text: '$durationF min');
    return Scaffold(
        backgroundColor: colorBG,
        body: CustomScrollView(
          slivers: <Widget>[
            appBarOnlyTitle('Add Recipe'),
            SliverList(
                delegate: SliverChildListDelegate([
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      recipeTitle(controllerTitle, colorBG),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(Icons.access_time_filled,
                                      color: colorIcons),
                                  Container(
                                      width: 90.0,
                                      child: Text(controllerTime.text)),
                                ],
                              ),
                              onTap: () async {
                                var resultingDuration =
                                    await showDurationPicker(
                                  context: context,
                                  initialTime: _duration,
                                );
                                setState(() {
                                  _duration = resultingDuration!;
                                  durationF = _duration.inMinutes;
                                });
                              },
                            ),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(Icons.food_bank, color: colorIcons),
                                  Container(width: 90.0, child: Text(dif!)),
                                ],
                              ),
                              onTap: () async {
                                dif = await showDifficulties(context);
                                setState(() {
                                  this.dif = dif;
                                });
                              },
                            ),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(Icons.person_sharp, color: colorIcons),
                                  Container(
                                      width: 90.0, child: Text(servings!)),
                                ],
                              ),
                              onTap: () async {
                                servings = await showServings(context, servings);
                                setState(() {
                                  this.servings = servings;
                                  print(servings);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      recipeDescription(controllerDescription, colorBG),
                      SizedBox(height: 20),
                      recipePreparation(controllerPreparation, colorBG),
                    ],
                  ))
            ]))
          ],
        ));
  }
}
