import 'dart:async';

import 'package:farmers_market_web/blocs/auth_bloc.dart';
import 'package:farmers_market_web/screens/homepage.dart';
import 'package:farmers_market_web/screens/vendor.dart';
import 'package:farmers_market_web/styles/base.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:farmers_market_web/widgets/alerts.dart';
import 'package:farmers_market_web/widgets/button.dart';
import 'package:farmers_market_web/widgets/social_button.dart';
import 'package:farmers_market_web/widgets/textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          //RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          //elevation: 5.0,
          child: Container(
            child: Row(
              children: <Widget>[
                //(screenSize.width > 600)
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
                              height: 120,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Center(
                              child: Text(
                                "Welcome!!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text(
                              "It should only take a couple of seconds to login to your account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Center(
                            child: FlatButton(
                              color: Colors.orange,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Signup();
                                }));
                              },
                              child: Text(
                                "Create Account",
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
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ListView(
                      //direction: Axis.vertical,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 100,
                            alignment: Alignment.topCenter,
                          ),
                        ),

                        SizedBox(height: 30.0),

                        //InputField Widget from the widgets folder
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
                        SizedBox(height: 20.0),
                        StreamBuilder<bool>(
                            stream: authBloc.isValid,
                            builder: (context, snapshot) {
                              return AppButton(
                                buttonText: 'Login',
                                buttonType: (snapshot.data == true)
                                    ? ButtonType.LightBlue
                                    : ButtonType.Disabled,
                                onPressed: authBloc.loginEmail,
                              );
                            }),
                        Center(
                          child: Text('Or', style: TextStyles.suggestion),
                        ),
                        Center(
                          child: Wrap(
                            children: <Widget>[
                              SizedBox(
                                width: 80.0,
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
                          child: Container(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'New Here? ',
                                    style: TextStyles.body,
                                    children: [
                                      TextSpan(
                                          text: 'Signup',
                                          style: TextStyles.link,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return Signup();
                                              }));
                                            })
                                    ])),
                          ),
                        )
                      ],
                    ),
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
