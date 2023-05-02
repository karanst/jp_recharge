import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quick_pay/Auth/Registration/UI/register_interactor.dart';
import 'package:quick_pay/Auth/login_navigator.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/assets.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/helper/apiservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../BottomNavigation/Home/home.dart';
import '../../../helper/constant.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;
  final String? phoneNumber;

  RegistrationUI(this.registrationInteractor, this.phoneNumber);

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  bool isLoading = false;
  bool isloader = false;

  TextEditingController mobileCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController addressCtr = TextEditingController();

  registerUser() async {
    var headers = {
      'Cookie':
          'ci_session=ffffc57e44a0c1c5fa3fff2590cbff7bd73843c5; ekart_security_cookie=19d081fe2b0ed3bced56c82e36e72db0'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${ApiService.userRegister}'));
    request.fields.addAll({
      'name': nameCtr.text,
      'email': emailCtr.text,
      'mobile': mobileCtr.text,
      'password': "123456",
      'address': addressCtr.text,
    });
    print("fields----------${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalresponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalresponse);
      print("${jsonresponse['error']}__________________");
      if (jsonresponse['error'] == false) {
        print("user registerrrrrrrrrr_________");
        var id = jsonresponse['data'][0]['id'];
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("id", "${id}");
        var username = jsonresponse['data'][0]['username'];
        var address = jsonresponse['data'][0]['address'];
        var mobile = jsonresponse ['data'] [0] ['mobile'];
        var email = jsonresponse ['data'] [0] ["email"];
        preferences.setString("username", "${username}");
        preferences.setString("address", "${address}");
        preferences.setString("mobile", "${mobile}");
        preferences.setString("email", "${email}");
        print("thisis my email${email}");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${jsonresponse['message']}")));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${jsonresponse['message']}")));
      }
    } else {
      print(response.reasonPhrase);
    }
  }
  var _current = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Widget> carouselWidgets = [
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                TextSpan(text: locale.registerNownGet! + '\n\n'),
                TextSpan(
                    text: locale.ultimateExpOf! + '\n' + locale.quickPaying!,
                    style: TextStyle(fontSize: 18)),
              ])),
        ),
      ),
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                TextSpan(text: locale.registerNownGet! + '\n\n'),
                TextSpan(
                    text: locale.ultimateExpOf! + '\n' + locale.quickPaying!,
                    style: TextStyle(fontSize: 18)),
              ])),
        ),
      ),
    ];
    var theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        body: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: FadedSlideAnimation(
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(Assets.background),
                        Positioned(
                            top: 40,
                            child: Text(
                              locale.signUp!.toUpperCase(),
                              style: theme.textTheme.headline6!
                                  .copyWith(color: theme.scaffoldBackgroundColor),
                            )),
                        // CarouselSlider(
                        //   items: carouselWidgets,
                        //   options: CarouselOptions(
                        //       autoPlay: true,
                        //       viewportFraction: 1,
                        //       onPageChanged: (index, reason) {
                        //         setState(() {
                        //           _current = index;
                        //         });
                        //       }),
                        // ),
                        Positioned.directional(
                            textDirection: Directionality.of(context),
                            start: 0,
                            top: 30,
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: scaffoldBackgroundColor,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                })),
                        // Positioned.directional(
                        //   textDirection: Directionality.of(context),
                        //   bottom: 10,
                        //   child: Row(
                        //     children: carouselWidgets.map((i) {
                        //       int index = carouselWidgets.indexOf(i);
                        //       return Container(
                        //         width: 12.0,
                        //         height: 3.0,
                        //         margin: EdgeInsets.symmetric(
                        //             vertical: 16.0, horizontal: 4.0),
                        //         decoration: BoxDecoration(
                        //           shape: BoxShape.rectangle,
                        //           color: _current == index
                        //               ? Colors.white /*.withOpacity(0.9)*/
                        //               : Colors.white.withOpacity(0.5),
                        //         ),
                        //       );
                        //     }).toList(),
                        //   ),
                        // ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        child: Center(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            controller: nameCtr,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              contentPadding:
                                  EdgeInsets.only(left: 15, top: 15),
                              hintText: "Name",
                              hintStyle: TextStyle(color: blackColor),
                              prefixIcon: Icon(
                                Icons.person,
                                color: blackColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        child: Center(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter number';
                              }
                              return null;
                            },
                            controller: mobileCtr,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              contentPadding: EdgeInsets.only(left: 15, top: 15),
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(color: blackColor),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: blackColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        child: Center(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                            controller: emailCtr,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              contentPadding: EdgeInsets.only(left: 15, top: 15),
                              hintText: "Email",
                              hintStyle: TextStyle(color: blackColor),
                              prefixIcon: Icon(
                                Icons.email,
                                color: blackColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    //   child: Card(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10)),
                    //     elevation: 10,
                    //     child: Center(
                    //       child: TextFormField(
                    //         validator: (value) {
                    //           if (value == null || value.isEmpty) {
                    //             return 'Please enter password';
                    //           }
                    //           return null;
                    //         },
                    //         controller: passwordCtr,
                    //         obscureText: true,
                    //         decoration: InputDecoration(
                    //           border: InputBorder.none,
                    //           counterText: "",
                    //           contentPadding: EdgeInsets.only(left: 15, top: 15),
                    //           hintText: "Password",
                    //           hintStyle: TextStyle(color: blackColor),
                    //           prefixIcon: Icon(
                    //             Icons.lock,
                    //             color: blackColor,
                    //             size: 20,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 10,
                        child: Center(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter address';
                              }
                              return null;
                            },
                            controller: addressCtr,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              contentPadding: EdgeInsets.only(left: 15, top: 15),
                              hintText: "Address",
                              hintStyle: TextStyle(color: blackColor),
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: blackColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              isloader = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Register")));

                              // Fluttertoast.showToast(msg: "User Register");
                              registerUser();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Correct Credentials!")));
                            }
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [primary, primary],
                                    stops: [0, 1]),
                                color: primary),
                            child: Center(
                                child: Text("Sign Up",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white))),
                          )),
                    ),

                  ],
                ),
              ],
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ),
      ),
    );
  }
}
