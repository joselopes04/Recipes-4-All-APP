import 'package:Recipes_app/src/styles/styles.dart';
import 'package:flutter/material.dart';

//https://www.regextester.com - Regex help

Widget emailInput(TextEditingController controller, Color fillColor, bool enabled) {
  final emailValidator = RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
  return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        enabled: enabled,
        prefixIcon: Icon(Icons.email),
        fillColor: fillColor,
        hintText: 'Email',
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) {
        if (email!.isEmpty) {
          return "Please enter an email";
        } else if (emailValidator.hasMatch(email) == false) {
          return "Please enter a valid email";
        }
        ;
        return null;
      });
}

Widget usernameInput(TextEditingController controller, Color fillColor, bool enabled) {
  final usernameValidator = RegExp(r'^(?=[a-zA-Z0-9._\u00C0-\u00FF]{3,20}$)(?!.*[_.]{2})[^_.].*[^_.]$');
  return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          enabled: enabled,
          filled: true,
          prefixIcon: Icon(Icons.person),
          fillColor: fillColor,
          hintText: 'Username',
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (username) {
        if (username!.isEmpty) {
          return "Please enter an username";
        } else if (usernameValidator.hasMatch(username) == false) {
          return "Must have 3-20 characters and no special characters";
        }
        ;
        return null;
      });
}

Widget passwordInput(TextEditingController controller, Color fillColor, bool enabled) {
  final passwordValidator =
      RegExp(r'^(?=.*[a-z])(?=.*\d)[a-zA-Z\d\w\W]{8,20}$');
  return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          filled: true,
          enabled: enabled,
          prefixIcon: Icon(Icons.lock),
          fillColor: fillColor,
          hintText: 'Password',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (password) {
        if (password!.isEmpty) {
          return "Please enter a strong password";
        } else if (passwordValidator.hasMatch(password) == false) {
          return "Must have 8-20 characters and at least 1 number";
        }
        ;
        return null;
      });
}

Widget recipeTitle(TextEditingController controller, Color fillColor) {
  final titleValidator = RegExp(r'^(?=[a-zA-Z\u00C0-\u00FF ]{3,50}$)(?!.*[_.]{2})[^_.].*[^_.]$');
  return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          prefixIcon: Icon(Icons.title),
          fillColor: fillColor,
          hintText: 'Title',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (title) {
        if (title!.isEmpty) {
          return "Please enter a title";
        } else if (titleValidator.hasMatch(title) == false) {
          return "Must have 3-50 characters and no special characters";
        }
        ;
        return null;
      });
}

Widget recipeDescription(TextEditingController controller, Color fillColor) {
  final descriptionValidator =
      RegExp(r'^(?=[a-zA-Z\u00C0-\u00FF ]{10,200}$)(?!.*[_.]{2})[^_.].*[^_.]$');
  return TextFormField(
      minLines: 1,
      maxLines: 10,
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          prefixIcon: Icon(Icons.description),
          fillColor: fillColor,
          hintText: 'Description',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (desc) {
        if (desc!.isEmpty) {
          return "Please enter a description";
        } else if (descriptionValidator.hasMatch(desc) == false) {
          return "Must have 10-200 characters and no special characters";
        }
        ;
        return null;
      });
}

Widget recipePreparation(TextEditingController controller, Color fillColor) {
  final descriptionValidator =
      RegExp(r'^(?=[a-zA-Z\u00C0-\u00FF ]{10,200}$)(?!.*[_.]{2})[^_.].*[^_.]$');
  return TextFormField(
      minLines: 1,
      maxLines: 10,
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          prefixIcon: Icon(Icons.checklist),
          prefixIconColor: colorIcons,
          fillColor: fillColor,
          hintText: 'Preparation',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (text) {
        if (text!.isEmpty) {
          return "Please enter a description";
        } else if (descriptionValidator.hasMatch(text) == false) {
          return "Must have 10-200 characters and no special characters";
        }
        ;
        return null;
      });
}

Widget servingsTextField(TextEditingController controller){
  final servingsValidator = RegExp(r'^[0-9]*$');
  return TextFormField(
    textAlign: TextAlign.center,
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        border:
            UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (number) {
      if (number == ""){
        return "The minimum is 1 serving";
      }
      if (servingsValidator.hasMatch(number!)) {
        int num = int.parse(number!);
        if (num < 1) {
          return "The minimum is 1 serving";
        } else if (num > 50) {
          return "The maximum of servings is 50";
        }
        return null;
      } else {
        return "Please enter a correct number";
      }
    },
  );
}
