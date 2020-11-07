import 'dart:async';

import 'package:farmers_market_web/screens/homepage.dart';
import 'package:farmers_market_web/screens/homescreen.dart';
import 'package:farmers_market_web/screens/login.dart';
import 'package:farmers_market_web/screens/vendor.dart';
import 'package:farmers_market_web/styles/base.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:farmers_market_web/widgets/alerts.dart';
import 'package:farmers_market_web/widgets/button.dart';
import 'package:farmers_market_web/widgets/social_button.dart';
import 'package:farmers_market_web/widgets/textfield.dart';
import 'package:flutter/material.dart';
//import 'package:farmers_market_web/widgets/input_field.dart';
import 'package:farmers_market_web/blocs/auth_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  StreamSubscription _userSubscription;
  StreamSubscription _errorMessageSubscription;
  @override
  void initState() {
    final authBloc = Provider.of<AuthBloc>(context, listen: false);
    _userSubscription = authBloc.user.listen((user) {
      if (user != null)
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Vendor();
        }));
    });

    _errorMessageSubscription = authBloc.errorMessage.listen((errorMessage) {
      if (errorMessage != '') {
        AppAlerts.showErrorDialog(context, errorMessage)
            .then((_) => authBloc.clearErrorMessage());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    _errorMessageSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    return Scaffold(
      body: pageBody(context, authBloc),
    );
  }

  Widget pageBody(BuildContext context, AuthBloc authBloc) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            EdgeInsets.only(top: 40.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          //shape:
          // RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          ///elevation: 5.0,
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: MediaQuery.of(context).size.height,
                  color: AppColors.darkblue,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 85.0, right: 50.0, left: 50.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              "assets/images/mart.png",
                              height: 150,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text(
                              "Let's get you set up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text(
                              "If you already have an Account",
                              style: TextStyles.start,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Center(
                            child: FlatButton(
                              color: AppColors.orange,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Login();
                                }));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.8,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                      top: 100.0, right: 10.0, left: 70.0, bottom: 5.0),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 80,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      const SizedBox(height: 21.0),

                      //InputField Widget from the widgets folder
                      //InputField(label: "Username", content: "First  Last"),
                      StreamBuilder<String>(
                          //stream: authBloc.username,
                          builder: (context, snapshot) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: AppTextField(
                            hintText: 'First Last name',
                            materialIcon: Icons.person,
                            textInputType: TextInputType.text,
                            errorText: snapshot.error,
                            // onChanged: authBloc.changeUsername,
                          ),
                        );
                      }),
                      //SizedBox(height: 20.0),

                      SizedBox(height: 20.0),

                      //InputField Widget from the widgets folder
                      //InputField(label: "Email", content: "anything@site.com"),
                      StreamBuilder<String>(
                          stream: authBloc.email,
                          builder: (context, snapshot) {
                            return Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: AppTextField(
                                hintText: 'Enter your email Address',
                                materialIcon: Icons.email,
                                textInputType: TextInputType.emailAddress,
                                errorText: snapshot.error,
                                onChanged: authBloc.changeEmail,
                              ),
                            );
                          }),
                      SizedBox(height: 20.0),

                      //InputField(label: "Password", content: "********"),
                      StreamBuilder<String>(
                          stream: authBloc.password,
                          builder: (context, snapshot) {
                            return Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: AppTextField(
                                hintText: 'Enter your Password',
                                materialIcon: Icons.lock,
                                obscureText: true,
                                errorText: snapshot.error,
                                onChanged: authBloc.changePassword,
                              ),
                            );
                          }),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: FormBuilderCheckbox(
                          hoverColor: AppColors.orange,
                          activeColor: AppColors.darkblue,
                          checkColor: AppColors.green,
                          decoration: InputDecoration(
                              fillColor: Colors.white, isCollapsed: true),
                          attribute: 'accept_terms',
                          initialValue: false,
                          leadingInput: true,
                          label: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'I have read and agree to the ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('launch url');
                                    },
                                ),
                              ],
                            ),
                          ),
                          validators: [
                            FormBuilderValidators.requiredTrue(
                              errorText:
                                  'You must accept terms and conditions to continue',
                            ),
                          ],
                        ),
                      ),
                      //Membership Widget from the widgets folder

                      StreamBuilder<bool>(
                          stream: authBloc.isValid,
                          builder: (context, snapshot) {
                            return AppButton(
                              buttonText: 'Create Account',
                              buttonType: (snapshot.data == true)
                                  ? ButtonType.LightBlue
                                  : ButtonType.Disabled,
                              onPressed: authBloc.signupEmail,
                            );
                          }),
                      Center(
                        child: Text('Or', style: TextStyles.suggestion),
                      ),
                      Center(
                        child: Wrap(
                          children: <Widget>[
                            SizedBox(
                              width: 100.0,
                            ),
                            FlatButton(
                              color: Colors.grey[200],
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
                              },
                              child: Text("Cancel"),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            AppSocialButton(
                              socialType: SocialType.Facebook,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            AppSocialButton(socialType: SocialType.Google),
                          ],
                        ),
                      ),
                      Center(
                        //padding: BaseStyles.listPadding,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Already Have an Account? ',
                                style: TextStyles.body,
                                children: [
                                  TextSpan(
                                      text: 'Login',
                                      style: TextStyles.link,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Login();
                                          }));
                                        })
                                ])),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
