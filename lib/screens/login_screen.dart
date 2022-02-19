import 'package:excercise2/components/custom_button.dart';
import 'package:excercise2/components/custom_textfield.dart';
import 'package:excercise2/utils/constant.dart';
import 'package:excercise2/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  SnackBar snackBar = SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        'Incorrect email or password',
        style: TextStyle(color: Colors.white),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: 'Username',
              controller: userNameController,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextField(
              label: 'Password',
              controller: passwordController,
              isObsure: true,
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                label: 'Login',
                onTap: () async {
                  if (userNameController.text != userName ||
                      passwordController.text != password) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String randString = getRandString(15);
                    print(randString);
                    prefs.setString('tokenValue', randString);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => DashBoardScreen()));
                    print('correct user');
                  }
                })
          ],
        ),
      ),
    );
  }
}
